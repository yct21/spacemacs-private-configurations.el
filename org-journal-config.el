(defun spacemeow/init-org-journal ()
  (use-package org-journal
    :defer t
    :init
    (setq org-journal-dir "~/stf/")
    (spacemacs/set-leader-keys "oj" 'org-journal-new-entry)
    ))

(defun spacemeow/post-init-org-journal ()
  (with-eval-after-load 'org-journal
    (define-key org-journal-mode-map (kbd "C-k") 'org-journal-open-previous-entry)
    (define-key org-journal-mode-map (kbd "C-j") 'org-journal-open-next-entry)
    (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode "is" 'spacemeow/org-insert-src-block)
    (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode ":" 'org-set-tags)
    (add-hook 'org-journal-mode-hook 'outline-show-all)))
