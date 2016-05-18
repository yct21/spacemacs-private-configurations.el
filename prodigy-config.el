(setq-local spacemeow-rails-projects
            '("~/code/playground/rails-ac-react"
              "~/code/lab/Rails5-ActionCable-Redux-React-ChatAppExample"))

(setq-local available-port 3000)

(defun spacemeow//available-port ()
  (let ((current-port available-port))
    (setq available-port (+ available-port 1))
    current-port))

(defun spacemeow//define-rails-services (project-path)
  "Define rails project services in prodigy."
  (let ((service-name (file-name-nondirectory project-path))
        (path project-path)
        (port (spacemeow//available-port)))
    (prodigy-define-service
      :name service-name
      :command "bundle"
      :args '("exec" "rails" "server")
      :cwd project-path
      :port port
      :url (format "http://127.0.0.1:%s/" port)
      :tags '(rails))))

(defun spacemeow/post-init-prodigy ()
  (mapc 'spacemeow//define-rails-services spacemeow-rails-projects)

  (prodigy-define-service
    :name "Electron Wechat"
    :command "npm"
    :args '("start")
    :cwd "~/code/lab/electronic-wechat"
    :tags '(app)
    :kill-signal 'sigkill
    :kill-process-buffer-on-stop t))
