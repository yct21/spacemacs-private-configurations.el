(defun spacemeow/init-org-octopress ()
    "init org-octopress package"
    (use-package org-octopress
      :commands org-octopress
      :config
      (setq org-octopress-directory-top "~/12tcy/source")
      (setq org-octopress-directory-posts "~/12tcy/source/_posts")
      (setq org-octopress-directory-org-top "~/12tcy/source")
      (setq org-octopress-directory-org-posts "~/12tcy/source/_orgs")
      (setq org-octopress-setup-file "~/12tcy/setupfile.org")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode "oe" 'org-export-dispatch))
  )
