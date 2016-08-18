(defun spacemeow/init-lispyville ()
  (use-package lispyville
    :defer t
    :init
    (spacemeow//add-hooks-for-lispyville)
    :config
    (spacemeow//set-lispyville-keytheme)
    ))

(defun spacemeow//add-hooks-for-lispyville ()
  (add-hook 'emacs-lisp-mode-hook (lambda () (lispyville-mode 1)))
  (add-hook 'ielm-mode-hook (lambda () (lispyville-mode 1)))
  (add-hook 'inferior-emacs-lisp-mode-hook (lambda () (lispyville-mode 1)))
  ;; (add-hook 'spacemacs-mode-hook (lambda () (lispyville-mode 1)))
  (add-hook 'clojure-mode-hook (lambda () (lispyville-mode 1)))
  (add-hook 'scheme-mode-hook (lambda () (lispyville-mode 1)))
  (add-hook 'cider-repl-mode-hook (lambda () (lispyville-mode 1))))

(defun spacemeow//set-lispyville-keytheme ()
  (with-eval-after-load 'lispyville
    (lispyville-set-key-theme '(operators
                                additional-movement
                                slurp/barf-lispy
                                additional
                                mark))))
