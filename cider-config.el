(defun spacemeow/post-init-cider ()
  (with-eval-after-load 'cider
    (setq cider-cljs-lein-repl
          "(do (require 'figwheel-sidecar.repl-api)
           (figwheel-sidecar.repl-api/start-figwheel!)
           (figwheel-sidecar.repl-api/cljs-repl))")
    (setq cider-boot-parameters "cider repl -s dev wait")))
