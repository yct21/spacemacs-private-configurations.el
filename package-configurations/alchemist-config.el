(defun spacemeow/post-init-alchemist ()
  (with-eval-after-load 'alchemist
    (advice-add 'alchemist-report-display-buffer :override #'spacemeow//alchemist-display-buffer)))

(defun spacemeow//alchemist-display-buffer (buffer)
  "Display report at buttom"
  (display-buffer
     buffer
     '((display-buffer-reuse-window
        display-buffer-at-bottom
        display-buffer-pop-up-window
        display-buffer-pop-up-frame))))
