(defun spacemeow/post-init-evil ()
  (with-eval-after-load 'evil
    (define-key evil-motion-state-map "t" 'evil-avy-goto-char)
    (define-key evil-normal-state-map "t" 'evil-avy-goto-char)
    (define-key evil-motion-state-map "T" 'evil-avy-goto-line)
    (define-key evil-normal-state-map "T" 'evil-avy-goto-line)
    (with-eval-after-load 'org
      (evil-define-key 'normal evil-org-mode-map "t" nil)
      (evil-define-key 'normal evil-org-mode-map "f" 'org-todo))))
