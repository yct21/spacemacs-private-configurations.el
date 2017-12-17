(defun spacemeow/init-indium ()
  (use-package indium
    :config
    (add-to-list 'evil-emacs-state-modes 'indium-repl-mode)
    (spacemeow//init-hydra-indium)
    (spacemacs/set-leader-keys-for-minor-mode 'indium-debugger-mode "oi" 'hydra-indium/body)))

(defun spacemeow//init-hydra-indium ()
  (with-eval-after-load 'hydra
    (defhydra hydra-indium (:pre (set-cursor-color "#40e0d0"))
      "Indium debugger"
      ("q" nil "quit")
      ("d" indium-debugger-step-over "over")
      ("i" indium-debugger-step-into "into")
      ("o" indium-debugger-step-out "out")
      ("c" indium-debugger-resume "resume")
      ("l" indium-debugger-locals "locals")
      ("s" indium-debugger-stack-frames "stack frames")
      ("h" indium-debugger-here "here")
      ("e" indium-debugger-evaluate "evaluate")
      ("n" indium-debugger-next-frame "next frame")
      ("p" indium-debugger-previous-frame "previous frame")
      )))
