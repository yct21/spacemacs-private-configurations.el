(with-eval-after-load 'prodigy
  (spacemeow//prodigy-services-mostly-harmless))

(defun spacemeow//prodigy-services-mostly-harmless ()
    (let ((cwd "/Users/yct21/code/side-projects/mostly-harmless")
          (tags '("mostly-harmless")))
      (prodigy-define-service
        :name "dev-main"
        :command "yarn"
        :cwd cwd
        :args '("run" "dev-main"))
      (prodigy-define-service
        :name "dev-renderer"
        :command "yarn"
        :cwd cwd
        :args '("run" "dev-renderer"))))
