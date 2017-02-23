(defun spacemeow/post-init-projectile ()
  (with-eval-after-load 'projectile
    (setq projectile-test-suffix-function 'spacemeow//projectile-test-suffix-function)))

(defvar-local spacemeow-projectile-test-suffix ".test")

(defun spacemeow//projectile-test-suffix-function (_)
  spacemeow-projectile-test-suffix)
