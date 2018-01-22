;;; funcs.el --- Spacemeow Layer packages File for Spacemacs
;;
;; Copyright (c) 2016 Chutian Yang
;;
;; Author: Chutian Yang <yct21@12tcy.com>
;; URL: https://github.com/yct21/spacemeow
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(require 'cl)

(defun spacemeow/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (spacemeow/retrieve-chrome-current-tab-url)))

(defun spacemeow/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
                 (concat
                  "set frontmostApplication to path to frontmost application\n"
                  "tell application \"Google Chrome\"\n"
                  "	set theUrl to get URL of active tab of first window\n"
                  "	set theResult to (get theUrl) \n"
                  "end tell\n"
                  "activate application (frontmostApplication as text)\n"
                  "set links to {}\n"
                  "copy theResult to the end of links\n"
                  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

(defun spacemeow/insert-chrome-current-tab-url-as-org-link(link-description)
  "Get the URL of active tab of chrome, and insert it as an org link"
  (interactive "sLink description: ")
  (insert (format "[[%s][%s]]"
                  (spacemeow/retrieve-chrome-current-tab-url)
                  link-description)))


;; Screenshot
(defvar-local spacemeow-image-path nil)

(defun spacemeow//insert-org-or-md-img-link (prefix imagename)
  (if (equal (file-name-extension (buffer-file-name)) "org")
      (insert (format "[[%s%s]]" prefix imagename))
    (insert (format "![%s](%s%s)" imagename prefix imagename))))

(defun spacemeow/capture-screenshot (basename)
  "Take a screenshot into a timestamped unique-named file in the specified image path insert a link to this file."
  (interactive "sScreenshot name: ")
  (if (equal basename "")
      (setq basename (format-time-string "%Y%m%d_%H%M%S")))
  (setq fullpath
        (concat (file-name-directory (buffer-file-name))
                "../assets/"
                (file-name-base (buffer-file-name))
                "_"
                basename))
  (setq relativepath
        (concat (file-name-base (buffer-file-name))
                "_"
                basename
                ".png"))
  (if (file-exists-p (file-name-directory fullpath))
      (progn
        (setq final-image-full-path (concat fullpath ".png"))
        (call-process "screencapture" nil nil nil "-s" final-image-full-path)
        (if (executable-find "convertt")
            (progn
              (setq resize-command-str (format "convert %s -resize 800x600 %s" final-image-full-path final-image-full-path))
              (shell-command-to-string resize-command-str)))
        (spacemeow//insert-org-or-md-img-link "../../assets/" relativepath))
    (progn
      (call-process "screencapture" nil nil nil "-s" (concat basename ".png"))
      (spacemeow//insert-org-or-md-img-link "./" (concat basename ".png"))))
  (insert "\n"))


;; Notification
(defun spacemeow/display-system-notification (title content)
  (do-applescript (format
                   "display notification \"%s\" with title \"%s\""
                   content
                   title)))


(defun spacemeow/copy-as-org()
  (interactive)
  (let ((str (shell-command-to-string "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | pandoc -f html -t json --wrap=none | pandoc -f json -t org --wrap=none")))
    (kill-new str)
    (yank)))
