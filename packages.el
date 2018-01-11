;;; packages.el --- spacemeow layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst spacemeow-packages
  '((org :location built-in)
    (emmet-mode :location (recipe
                           :fetcher github
                           :repo "yct21/emmet-mode"
                           :branch "upgrade-snippets"))
    (tide :location (recipe
                     :fetcher github
                     :repo "robbert-vdh/tide"
                     :branch "feature/indirect-buffer-support"))
    (spacemeow-modeline :location built-in)
    org-alert
    (org-opml :location (recipe
                         :fetcher github
                         :repo "org-opml/org-opml"))
    (org-wiki :location (recipe
                         :fetcher github
                         :repo "yct21/org-wiki"))
    4clojure
    evil
    alchemist
    flycheck
    typescript
    org-reveal
    org-journal
    company-flow
    wakatime-mode
    helm-github-stars
    cider
    indium
    wttrin
    elm-mode
    vue-mode
    projectile
    lispyville
    nodejs-repl
    tiny
    multi-term))

(defconst spacemeow--directories
  '("package-configurations"
    "features"))



;; Who needs autoload...
(dolist (directory spacemeow--directories)
  (let ((directory-full-name (format "%s%s"
                                     (file-name-directory load-file-name)
                                     directory))
        (file-regex "[^\.].*\.el$"))
    (dolist (file (directory-files directory-full-name t file-regex))
      (load-file file))))
