;;; keybindings.el --- Spacemeow Layer packages File for Spacemacs
;;
;; Copyright (c) 2015-2016 Chutian Yang
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(define-key global-map (kbd "C-c y") 'youdao-dictionary-search-at-point+)

(global-set-key (kbd "C-c b") 'org-iswitchb)
(spacemacs/set-leader-keys "oj" 'org-journal-new-entry)

(spacemacs/set-leader-keys "og" '(lambda () (interactive) (find-file "~/orlog/gtd.org")))
