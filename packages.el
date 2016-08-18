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
  '(org-journal
    (org :location built-in)
    prodigy
    request
    org-octopress
    evil
    wakatime-mode
    multiple-cursors
    cider
    wttrin
    hydra
    lispyville
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
