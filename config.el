;;; config.el --- spacemeow Layer packages File for Spacemacs
;; Copyright (c) 2015-2016 Spacemeow
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar spacemeow-rescuetime-score -42.0 "Fetched productivity score from rescuetime.")
(defvar spacemeow-wakatime-total " NA " "Fetched wakatime summary")
(defun spacemacs//unset-scroll-margin ())
(setq frame-title-format
      '(""
        (:eval (if org-clock-current-task
                   (format "* %s * ||-> %s <-||" org-clock-current-task (/ org-pomodoro-countdown 60))
                 "* IDLE * | "))
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))

(define-abbrev-table 'global-abbrev-table '(
  ;; math/unicode symbols
  ("42em" "yct21@12tcy.com")
  ("42in" "∈")
  ("42nin" "∉")
  ("42inf" "∞")
  ("42luv" "♥")
  ("42smly" "☺")))

(setq user-mail-address "yct21@12tcy.com")

(setq evil-shift-width 2)

;; word around to disable center buffer mode in space-doc
(defvar spacemacs-space-doc-modificators
  '(spacemacs//space-doc-org-indent-mode
    spacemacs//space-doc-view-mode
    spacemacs//space-doc-hide-line-numbers
    spacemacs//space-doc-emphasis-overlays
    spacemacs//space-doc-meta-tags-overlays
    spacemacs//space-doc-link-protocol
    spacemacs//space-doc-org-block-line-face-remap
    spacemacs//space-doc-org-kbd-face-remap
    spacemacs//space-doc-resize-inline-images
    spacemacs//space-doc-advice-org-do-emphasis-faces))
