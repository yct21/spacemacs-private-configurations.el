(defun spacemeow/init-company-flow ()
  (use-package company-flow
    :init
    (eval-after-load 'company
      '(add-to-list 'company-backends 'company-flow))))
