(defun spacemeow/init-org-wiki ()
  (use-package org-wiki
    :init
    (setq org-wiki-location "~/mini-galaxy")
    (setq org-wiki-server-port "4224")
    (spacemeow//define-org-wiki-keybindings)
    (spacemeow//define-org-wiki-template)

    ;; https://github.com/caiorss/org-wiki/issues/14
    (eval-after-load "grep"
      '(grep-compute-defaults))
    ))

(defun spacemeow//define-org-wiki-keybindings ()
  (spacemacs/declare-prefix  "k" "org-wiki")
  (spacemacs/set-leader-keys "k?" 'org-wiki-help)
  (spacemacs/set-leader-keys "k`" 'org-wiki-website)
  (spacemacs/set-leader-keys "km" 'org-wiki-index)
  (spacemacs/set-leader-keys "kp" 'org-wiki-helm)
  (spacemacs/set-leader-keys "kb" 'org-wiki-switch)
  (spacemacs/set-leader-keys "kn" 'org-wiki-new)
  (spacemacs/declare-prefix "ki" "insert")
  (spacemacs/set-leader-keys "kil" 'org-wiki-insert-link)
  (spacemacs/set-leader-keys "kib" 'org-wiki-insert-block)
  (spacemacs/set-leader-keys "kis" 'org-wiki-insert-symbol)
  (spacemacs/set-leader-keys "kin" 'org-wiki-insert-new)
  (spacemacs/set-leader-keys "kih" 'org-wiki-header)
  (spacemacs/set-leader-keys "kia" 'org-wiki-asset-insert)
  (spacemacs/set-leader-keys "kif" 'org-wiki-asset-insert-file)
  (spacemacs/set-leader-keys "kii" 'org-wiki-asset-insert-image)
  (spacemacs/set-leader-keys "kic" 'org-wiki-asset-insert-block)
  (spacemacs/declare-prefix "ka" "assets")
  (spacemacs/set-leader-keys "kaf" 'org-wiki-asset-find-file)
  (spacemacs/set-leader-keys "kao" 'org-wiki-asset-find-sys)
  (spacemacs/set-leader-keys "kd" 'org-wiki-dired)
  (spacemacs/set-leader-keys "ke" 'org-wiki-export-html)
  (spacemacs/set-leader-keys "kt" 'org-wiki-server-toggle)
  (spacemacs/set-leader-keys "ko" 'org-wiki-index-html)
  (spacemacs/declare-prefix "ks" "search")
  (spacemacs/set-leader-keys "ksp" 'org-wiki-search)
  (spacemacs/set-leader-keys "kss" 'org-wiki-occur)
  (spacemacs/set-leader-keys "ksk" 'org-wiki-keywords)
  (spacemacs/set-leader-keys "kl" 'org-wiki-desc)
  (spacemacs/declare-prefix "kc" "copy-path")
  (spacemacs/set-leader-keys "kcl" 'org-wiki-copy-location)
  (spacemacs/set-leader-keys "kci" 'org-wiki-copy-index-html)
  (spacemacs/set-leader-keys "kca" 'org-wiki-copy-asset-path)
  )

(defun spacemeow//define-org-wiki-template ()
  (setq org-wiki-template
     (string-trim
         "
#+TITLE: %n
#+DESCRIPTION:
#+KEYWORDS:
#+STARTUP:  content
#+DATE: %d
#+INCLUDE: assets/style.org

- [[wiki:index][Index]]

- Related:

* %n
")))
