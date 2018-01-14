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
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "w?" 'org-wiki-help)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "w`" 'org-wiki-website)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wm" 'org-wiki-index)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wp" 'org-wiki-helm)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wb" 'org-wiki-switch)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wn" 'org-wiki-new)
  (spacemacs/declare-prefix-for-mode 'org-mode "mwi" "insert")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wil" 'org-wiki-insert-link)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wib" 'org-wiki-insert-block)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wis" 'org-wiki-insert-symbol)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "win" 'org-wiki-insert-new)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wih" 'org-wiki-header)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wia" 'org-wiki-asset-insert)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wif" 'org-wiki-asset-insert-file)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wii" 'org-wiki-asset-insert-image)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wic" 'org-wiki-asset-insert-block)
  (spacemacs/declare-prefix-for-mode 'org-mode "mwa" "assets")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "waf" 'org-wiki-asset-find-file)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wao" 'org-wiki-asset-find-sys)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wd" 'org-wiki-dired)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "we" 'org-wiki-export-html)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wt" 'org-wiki-server-toggle)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wo" 'org-wiki-index-html)
  (spacemacs/declare-prefix-for-mode 'org-mode "mws" "search")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wsp" 'org-wiki-search)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wss" 'org-wiki-occur)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wsk" 'org-wiki-keywords)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wl" 'org-wiki-desc)
  (spacemacs/declare-prefix-for-mode 'org-mode "mwc" "copy-path")
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wcl" 'org-wiki-copy-location)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wci" 'org-wiki-copy-index-html)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wca" 'org-wiki-copy-asset-path)
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
