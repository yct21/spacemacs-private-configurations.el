;;; packages.el --- spacemeow layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst spacemeow-packages
  '(
    org-bullets
    org-download
    org-journal
    (org :location built-in)
    prodigy
    )
  )

(defun spacemeow/post-init-org-bullets()
  (setq org-bullets-bullet-list '("🐉" "🐠" "🐬" "🐤")))

(defun spacemeow/init-org-download ()
  (use-package org-download
    :defer t
    :init
    (org-download-enable)))

(defun spacemeow/init-org-journal ()
  (use-package org-journal
    :defer t
    :init
    (setq org-journal-dir "~/stf/")))

(defun spacemeow/post-init-org ()
  (with-eval-after-load 'org
    (progn
      (spacemacs|disable-company org-mode)
      ;; (spacemacs/set-leader-keys-for-major-mode 'org-mode
      ;;   "," 'org-priority)
      (require 'org-compat)
      (require 'org)
      ;; (add-to-list 'org-modules "org-habit")
      (add-to-list 'org-modules 'org-habit)
      (require 'org-habit)

      ;; define the refile targets
      (setq org-agenda-files (quote ("~/orlog" )))
      (setq org-default-notes-file "~/orlog/gtd.org")

      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )

      (setq org-capture-templates
            '(("t" "Todo" entry (file+headline "~/orlog/gtd.org" "Quick notes")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("n" "notes" entry (file+headline "~/orlog/notes.org" "Quick notes")
               "* TODO [#C] %?\n  %i\n %U"
               :empty-lines 1)
              ("b" "Blog Ideas" entry (file+headline "~/orlog/notes.org" "Blog Ideas")
               "* TODO [#B] %?\n  %i\n %U"
               :empty-lines 1)
              ("l" "links" entry (file+headline "~/orlog/gtd.org" "Quick notes")
               "* TODO [#C] %?\n  %i\n %a \n %U"
               :empty-lines 1)))

      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("w" . "Task")
              ("wa" "Task: Urgent / Important" tags-todo "+PRIORITY=\"A\"")
              ("wb" "Task: Not Urgent / Important" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "Task: Urgent / Not Important" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("p" . "project")
              ("pw" tags-todo "PROJECT+DREAM+CATEGORY=\"power grid\"")))

      (define-key org-mode-map (kbd "s-p") 'org-priority)
      (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)
      (setq org-refile-use-outline-path 'file)
      (setq org-outline-path-complete-in-steps nil)
      (setq org-refile-targets
            '((nil :maxlevel . 4)
              (org-agenda-files :maxlevel . 4)))
      ;; config stuck project
      (setq org-stuck-projects
            '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

      (setq org-agenda-inhibit-startup t)       ;; ~50x speedup
      (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
      (setq org-agenda-window-setup 'current-window)
      (setq org-log-done t)

      ;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
      (setq org-todo-keywords
            (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                    (sequence "WAITING(w@/!)" "SOMEDAY(S)"  "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

      ;; Change task state to STARTED when clocking in
      (setq org-clock-in-switch-to-state "STARTED")
      ;; Save clock data and notes in the LOGBOOK drawer
      (setq org-clock-into-drawer t)
      ;; Removes clocked tasks with 0:00 duration
      (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

      (setq org-tags-match-list-sublevels nil)

      ;; http://wenshanren.org/?p=327
      ;; change it to helm
      (defun spacemeow/org-insert-src-block (src-code-type)
        "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
        (interactive
         (let ((src-code-types
                '("emacs-lisp" "elixir" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
                  "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
                  "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
                  "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
                  "scheme" "sqlite")))
           (list (ido-completing-read "Source code type: " src-code-types))))
        (progn
          (newline-and-indent)
          (insert (format "#+BEGIN_SRC %s\n" src-code-type))
          (newline-and-indent)
          (insert "#+END_SRC\n")
          (previous-line 2)
          (org-edit-src-code)))

      (add-hook 'org-mode-hook '(lambda ()
                                  ;; keybinding for editing source code blocks
                                  ;; keybinding for inserting code blocks
                                  (local-set-key (kbd "C-c i s")
                                                 'spacemeow/org-insert-src-block)
                                  ))

      ;;reset subtask
      (setq org-default-properties (cons "RESET_SUBTASKS" org-default-properties))

      (defun org-reset-subtask-state-subtree ()
        "Reset all subtasks in an entry subtree."
        (interactive "*")
        (if (org-before-first-heading-p)
            (error "Not inside a tree")
          (save-excursion
            (save-restriction
              (org-narrow-to-subtree)
              (org-show-subtree)
              (goto-char (point-min))
              (beginning-of-line 2)
              (narrow-to-region (point) (point-max))
              (org-map-entries
               '(when (member (org-get-todo-state) org-done-keywords)
                  (org-todo (car org-todo-keywords))))
              ))))

      (defun org-reset-subtask-state-maybe ()
        "Reset all subtasks in an entry if the `RESET_SUBTASKS' property is set"
        (interactive "*")
        (if (org-entry-get (point) "RESET_SUBTASKS")
            (org-reset-subtask-state-subtree)))

      (defun org-subtask-reset ()
        (when (member org-state org-done-keywords) ;; org-state dynamically bound in org.el/org-todo
          (org-reset-subtask-state-maybe)
          (org-update-statistics-cookies t)))

      (org-babel-do-load-languages
       'org-babel-load-languages
       '((perl . t)
         (ruby . t)
         (sh . t)
         (js . t)
         (python . t)
         (emacs-lisp . t)
         (plantuml . t)
         (C . t)
         (ditaa . t)))
      )))

(defun spacemeow/post-init-prodigy ()
  (progn
    ;; define service
    (prodigy-define-service
      :name "Electron Wechat"
      :command "npm"
      :args '("start")
      :cwd "~/code/lab/electronic-wechat"
      :tags '(app)
      :kill-signal 'sigkill
      :kill-process-buffer-on-stop t)))
