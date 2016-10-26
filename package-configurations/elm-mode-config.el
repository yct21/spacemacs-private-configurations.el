(defun spacemeow/post-init-elm-mode ()
  (with-eval-after-load 'elm-mode
    (define-key elm-mode-map (kbd "TAB") 'elm-indent-cycle)
    (define-key elm-mode-map (kbd "C-k") 'elm-mode-format-buffer)))
