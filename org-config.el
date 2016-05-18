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

(defun spacemeow/post-init-org ()
  (spacemacs|disable-company org-mode)
  (add-to-list 'org-modules 'org-habit)
  (spacemeow//init-org-agenda)

  (define-key evil-normal-state-map (kbd "C-c C-w") 'org-refile)

  ;; define the refile targets
  (setq org-default-notes-file "~/orlog/gtd.org")

  (setq org-capture-templates
        '(("t" "Notes" entry (file+headline "~/orlog/gtd.org" "Quick notes")
           "* TODO [#B] %?\n  %i\n"
           :empty-lines 1)
          ("l" "links" entry (file+headline "~/orlog/gtd.org" "Quick notes")
           "* TODO [#C] %?\n  %i\n %a \n %U"
           :empty-lines 1)))

  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-targets
        '((nil :maxlevel . 4)
          (org-agenda-files :maxlevel . 4)))
  ;; config stuck project
  (setq org-stuck-projects
        '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

  (setq org-log-done t)

  ;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
                (sequence "WAITING(w@/!)" "SOMEDAY(S)"  "|" "CANCELLED(c@/!)" "MEETING(m)" "PHONE(p)"))))

  ;; Change task state to STARTED when clocking in
  (setq org-clock-in-switch-to-state "STARTED")
  ;; Save clock data and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t) ;; Show the clocked-in task - if any - in the header line

  (setq org-tags-match-list-sublevels nil)

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
  )


;;; Private functions
(defun spacemeow//init-org-agenda ()
  (with-eval-after-load 'org-agenda
    (setq org-agenda-files (quote ("~/orlog" )))

    (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
    (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
      "." 'spacemacs/org-agenda-transient-state/body)

    (setq org-agenda-custom-commands
          '(("w" . "Task")
            ("wa" "Task: Urgent / Important" tags-todo "+PRIORITY=\"A\"")
            ("wb" "Task: Not Urgent / Important" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
            ("wc" "Task: Urgent / Not Important" tags-todo "+PRIORITY=\"C\"")
            ("b" "Blog" tags-todo "BLOG")
            ("p" . "project")
            ("pw" tags-todo "PROJECT+DREAM+CATEGORY=\"power grid\"")))

    (setq org-agenda-inhibit-startup t)       ;; ~50x speedup
    (setq org-agenda-use-tag-inheritance nil) ;; 3-4x speedup
    (setq org-agenda-window-setup 'current-window)
    ))


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
