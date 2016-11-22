(defun spacemeow/init-ruby-guard ()
  (use-package ruby-guard
    :defer t
    :commands ruby-guard
    :config
    (spacemacs/set-leader-keys-for-major-mode 'ruby-mode "og" 'ruby-guard)
    ))
