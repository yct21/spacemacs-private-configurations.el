(defun spacemeow/init-nodejs-repl ()
  (use-package nodejs-repl
    :commands (nodejs-repl-switch-to-repl)
    :init
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode "'" 'nodejs-repl-switch-to-repl)
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode "ss" 'nodejs-repl-switch-to-repl)
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode "se" 'nodejs-repl-send-last-sexp)
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode "sr" 'nodejs-repl-send-region)
    (spacemacs/set-leader-keys-for-major-mode 'js2-mode "sb" 'nodejs-repl-send-buffer)
    ))
