(defun spacemeow/post-init-flycheck ()
  (with-eval-after-load 'flycheck
    (setq flycheck-javascript-eslint-executable "eslint-project-relative")))

(defun spacemeow/post-init-emmet-mode ()
  (with-eval-after-load 'emmet-mode
    (setq emmet-self-closing-tag-style " /")))
