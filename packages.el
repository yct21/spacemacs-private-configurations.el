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

(setq package-archives '(("gnu"   . "http://elpa.zilongshanren.com/gnu/")
                         ("melpa" . "http://elpa.zilongshanren.com/melpa/")
                         ("org" . "http://elpa.zilongshanren.com/org/")))

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
    multi-term))

(dolist (file (directory-files (format "%s%s" (file-name-directory load-file-name) "package-configurations") t "[^\.].*\.el$"))
  (load file))
