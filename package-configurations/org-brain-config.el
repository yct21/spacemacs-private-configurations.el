(defun spacemeow/post-init-org-brain ()
  (with-eval-after-load 'org-brain
    (setq org-brain-path "~/orlog")
    (org-brain-activate-cache-saving)))
