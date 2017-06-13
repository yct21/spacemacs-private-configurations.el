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

(global-set-key (kbd "C-l") 'tab-to-tab-stop)

(spacemacs/set-leader-keys "og" '(lambda () (interactive) (find-file "~/orlog/bulletjournal.org")))

(spacemacs/set-leader-keys "oi" 'spacemeow/capture-screenshot)

(spacemacs/set-leader-keys "or" 'revert-buffer)

(global-unset-key (kbd "C-\\"))

(spacemacs/set-leader-keys-for-major-mode 'inferior-emacs-lisp-mode "b" 'ielm-change-working-buffer)

(global-set-key (kbd "C-t") '(lambda () (insert "-")))
