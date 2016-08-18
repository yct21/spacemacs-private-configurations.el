;; Configurations for modeline / headline / frame title

(setq-default mode-line-misc-info
              (assq-delete-all 'which-func-mode mode-line-misc-info))

(defun spacemeow//mode-line-unicode-number (str)
  "Return a nice unicode representation of a single-digit number STR."
  (cond
   ((string= "1" str) "➊")
   ((string= "2" str) "➋")
   ((string= "3" str) "➌")
   ((string= "4" str) "➍")
   ((string= "5" str) "➎")
   ((string= "6" str) "➏")
   ((string= "7" str) "➐")
   ((string= "8" str) "➑")
   ((string= "9" str) "➒")
   ((string= "0" str) "➓")))

(defun spacemeow//window-number ()
  "Display current window number."
  (when (bound-and-true-p window-numbering-mode)
    (let* ((num (window-numbering-get-number))
           (str (when num (int-to-string num))))
      (spacemeow//mode-line-unicode-number str))))

(defun spacemeow//modeline-fill (face reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (let* ((reserved-space (or reserve 20))
         (reserved-space (if (and window-system (eq 'right (get-scroll-bar-mode)))
                             (- reserved-space 3)
                           reserved-space)))
    (propertize " "
                'display `((space :align-to
                                  (- (+ right right-fringe right-margin) ,reserve)))
                'face face)))

(defun spacemeow//modeline-buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (let ((buf-coding (format "%s" buffer-file-coding-system)))
    (if (string-match "\\(dos\\|unix\\|mac\\)" buf-coding)
        (match-string 1 buf-coding)
      buf-coding)))

(defun spacemeow//modeline-flycheck ()
  '(:eval
    (pcase flycheck-last-status-change
      ((\` not-checked) nil)
      ((\` no-checker) (propertize " -" 'face 'warning))
      ((\` running) (propertize " ✷" 'face 'success))
      ((\` errored) (propertize " !" 'face 'error))
      ((\` finished)
       (let* ((error-counts (flycheck-count-errors flycheck-current-errors))
              (no-errors (cdr (assq 'error error-counts)))
              (no-warnings (cdr (assq 'warning error-counts)))
              (face (cond (no-errors 'error)
                          (no-warnings 'warning)
                          (t 'success))))
         (propertize (format "[%s/%s]" (or no-errors 0) (or no-warnings 0))
                     'face face)))
      ((\` interrupted) " -")
      ((\` suspicious) '(propertize " ?" 'face 'warning)))))

(defun spacemeow//mode-line-window-number ()
  '(:eval (propertize
          (spacemeow//window-number)
          'face
          'font-lock-type-face)))

(defun spacemeow//modeline-buffer-name ()
  '(:eval (propertize "%b " 'face 'font-lock-keyword-face
                      'help-echo (buffer-file-name))))

(defun spacemeow//modeline-buffer-status ()
  " ["
  ;; insert vs overwrite mode, input-method in a tooltip
  '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
                      'face 'font-lock-preprocessor-face
                      'help-echo (concat "Buffer is in "
                                         (if overwrite-mode
                                             "overwrite"
                                           "insert") " mode")))

  ;; was this buffer modified since the last save?
  '(:eval (when (buffer-modified-p)
            (concat "," (propertize "Mod"
                                    'face 'font-lock-warning-face
                                    'help-echo "Buffer has been modified"))))

  ;; is this buffer read-only?
  '(:eval (when buffer-read-only
            (concat "," (propertize "RO"
                                    'face 'font-lock-type-face
                                    'help-echo "Buffer is read-only"))))
  "] ")

(defun spacemeow//modeline-cursor-relative-position ()
  "["
  (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
  "/"
  (propertize "%I" 'face 'font-lock-constant-face) ;; size
  "] ")

(defun spacemeow//modeline-major-mode ()
  '(:eval (propertize "%m" 'face 'font-lock-string-face
                     'help-echo buffer-file-coding-system)))

(setq-default mode-line-format
              (list
               " %1"
               (spacemeow//mode-line-window-number)
               "%1 "
               (spacemeow//modeline-buffer-name)
               (spacemeow//modeline-buffer-status)
               anzu--mode-line-format
               (spacemeow//modeline-major-mode)
               "%1 "
               (spacemeow//modeline-flycheck)
               "%1 "
               '(:eval evil-mode-line-tag)
               ;; minor modes
               '(:eval (when (> (window-width) 120)
                         minor-mode-alist))
               " "
               ;; git info
               '(:eval (when (> (window-width) 120)
                         `(vc-mode vc-mode)))
               " "
               ;; global-mode-string goes in mode-line-misc-info
               mode-line-misc-info
               (spacemeow//modeline-fill 'mode-line 20)
               ;; line and column
               "(" ;; '%02' to set to 2 chars at least; prevents flickering
               (propertize "%02l" 'face 'font-lock-type-face) ","
               (propertize "%02c" 'face 'font-lock-type-face)
               ") "
               '(:eval (spacemeow//modeline-buffer-encoding-abbrev))
               mode-line-end-spaces
               ;; add the time, with the date and the emacs uptime in the tooltip
               ;; '(:eval (propertize (format-time-string "%H:%M")
               ;;                     'help-echo
               ;;                     (concat (format-time-string "%c; ")
               ;;                             (emacs-uptime "Uptime:%hh"))))
               ))
