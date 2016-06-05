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
    org-pomodoro
    evil
    wakatime-mode
    cider
    multi-term))

(defconst spacemeow-additional-config-files
  '("config.secret"
    "org-config"
    "prodigy-config"
    "wakatime-config"
    "fetch-wakatime"
    "cider-config"
    "fetch-rescuetime"
    "multi-term-config"
    "org-journal-config"))

(mapc
  (lambda (file)
    (load-file (format "%s%s.el" (file-name-directory load-file-name) file)))
  spacemeow-additional-config-files)
