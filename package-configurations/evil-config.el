(defun spacemeow/post-init-evil ()
  (with-eval-after-load 'evil
    (define-key evil-motion-state-map "t" 'evil-avy-goto-char)
    (define-key evil-normal-state-map "t" 'evil-avy-goto-char)
    (define-key evil-motion-state-map "T" 'evil-avy-goto-line)
    (define-key evil-normal-state-map "T" 'evil-avy-goto-line)
    ;; Make movement keys work like they should
    (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
    (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
    (setq-default evil-cross-lines t)
    (with-eval-after-load 'org
      (evil-define-key 'normal evil-org-mode-map "t" nil)
      (evil-define-key 'normal evil-org-mode-map "f" 'org-todo))))
