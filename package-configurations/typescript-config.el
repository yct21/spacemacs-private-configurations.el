(defun spacemeow/post-init-typescript ()
  (with-eval-after-load 'typescript-mode
    (spacemacs/set-leader-keys-for-major-mode 'typescript-mode "ot" 'web-mode)
    (spacemacs/set-leader-keys-for-major-mode 'web-mode "ot" 'typescript-mode)))
