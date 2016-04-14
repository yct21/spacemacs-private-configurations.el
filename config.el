;;; config.el --- spacemeow Layer packages File for Spacemacs
;
;; Copyright (c) 2015-2016 Spacemeow
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" " Spacemeow - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name)) "%b"))))


(define-abbrev-table 'global-abbrev-table '(
  ;; math/unicode symbols
  ("42em", "yct21@12tcy.com")
  ("42in" "∈")
  ("42nin" "∉")
  ("42inf" "∞")
  ("42luv" "♥")
  ("42smly" "☺")))

(setq user-mail-address "yct21@12tcy.com")
