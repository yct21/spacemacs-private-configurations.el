(defun spacemeow/init-org-alert ()
  (use-package org-alert
    :init
    (setq org-alert-notification-title "TODO")
    (setq org-alert-headline-regexp "\\(Scheduled:.+\\|Deadline:.+\\)")
    (setq alert-default-style 'notifier)
    :config
    (org-alert-enable)))
