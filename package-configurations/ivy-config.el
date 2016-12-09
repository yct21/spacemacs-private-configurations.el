(defun spacemeow/post-init-ivy ()
  (with-eval-after-load 'ivy
    (setq ivy-re-builders-alist
          '((t . ivy--regex-fuzzy)))
    (setq ivy-initial-inputs-alist nil)))
