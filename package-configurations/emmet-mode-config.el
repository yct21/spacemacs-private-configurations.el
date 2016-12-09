(defun spacemeow/init-emmet-mode ()
  (html/init-emmet-mode))

(defun spacemeow/post-init-emmet-mode ()
  (with-eval-after-load 'emmet-mode
    (setq emmet-self-closing-tag-style " /")))
