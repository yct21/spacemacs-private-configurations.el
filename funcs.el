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

(defun spacemoew/hotspots ()
  "helm interface to my hotspots, which includes my locations,
org-files and bookmarks"
  (interactive)
  (helm :buffer "*helm: utities*"
        :sources `(,(spacemeow//hotspots-sources))))

(defun spacemeow//hotspots-sources ()
  "Construct the helm sources for my hotspots"
  `((name . "Mail and News")
    (candidates . (("Calendar" . (lambda ()  (browse-url "https://www.google.com/calendar/render")))
                   ("Github" . (lambda() (helm-github-stars)))
                   ("Calculator" . (lambda () (helm-calcul-expression)))
                   ("Run current flie" . (lambda () (zilongshanren/run-current-file)))
                   ("Agenda" . (lambda () (org-agenda "" "a")))
                   ("sicp" . (lambda() (browse-url "http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-4.html#%_toc_start")))))
    (candidate-number-limit)
    (action . (("Open" . (lambda (x) (funcall x)))))))


;; Screenshot
(defvar-local spacemeow-image-path nil)

(defun spacemeow/capture-screenshot (base-name)
  "Take a screenshot into a timestamped unique-named file in the specified image path insert a link to this file."
  (interactive "sScreenshot name: ")
  (if spacemeow-image-path
      (let* ((base-name (if (equal base-name "")
                            (format-time-string "%Y%m%d_%H%M%S")
                          base-name))
             (full-path (concat spacemeow-image-path
                                base-name
                                ".png"))
             (resize-command-str (format "convert %s -resize 800x600 %s" full-path full-path)))

        (if (file-exists-p (file-name-directory full-path))
            (progn
              (call-process "screencapture" nil nil nil "-s" full-path)
              (if (executable-find "convert")
                  (shell-command-to-string resize-command-str))
              (insert (format "[[%s]]" full-path))
              (spacemeow/display-system-notification "Image captured" (format "stored in %s" full-path)))
          (message "No such folder for storing image.")))
  (message "No image folder specified")))


;; Notification
(defun spacemeow/display-system-notification (title content)
  (do-applescript (format
                   "display notification \"%s\" with title \"%s\""
                   content
                   title)))

;; Seeing is believing of Ruby eval
;; (defun spacemeow/seeing-is-believing ()
;;   "Replace the current region (or the whole buffer, if none) with the output
;; of seeing_is_believing."
;;   (interactive)
;;   (let ((beg (if (region-active-p) (region-beginning) (point-min)))
;;         (end (if (region-active-p) (region-end) (point-max)))
;;         (origin (point)))
;;     (shell-command-on-region beg end "seeing_is_believing" nil 'replace)
;;     (goto-char origin)))
