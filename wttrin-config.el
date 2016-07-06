(defun spacemeow/init-wttrin ()
  "init wttrin"
  (use-package org-journal
    :defer t
    :init
    (setq wttrin-default-cities '("Hangzhou" "Tianjin" "Nanchang"))
    (spacemacs/set-leader-keys "ow" 'wttrin)))
