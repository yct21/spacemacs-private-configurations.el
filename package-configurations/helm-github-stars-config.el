(defun spacemeow/init-helm-github-stars ()
  (use-package helm-github-stars
    :defer
    :commands helm-github-stars
    :config
    (setq helm-github-stars-username "yct21")))