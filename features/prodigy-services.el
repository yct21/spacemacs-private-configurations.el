(with-eval-after-load 'prodigy
  (prodigy-define-service
    :name "material-ui doc"
    :command "yarn"
    :args '("run" "docs:start")
    :cwd "~/code/lab/material-ui"
    :tags '(doc)
    )
  )
