(defun spacemeow/post-init-multi-term ()
  (with-eval-after-load 'multi-term
    (spacemeow//define-multi-term)))


(defun spacemeow//define-multi-term ()
  (spacemacs/set-leader-keys "'" 'spacemeow/select-term)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "r" 'spacemeow/rename-term-buffer)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "k" '(lambda () (interactive) (term-send-raw-string "\C-u")))
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "e" 'spacemeow/copy-last-command-to-edit-buffer)
  (spacemacs/set-leader-keys-for-major-mode 'term-mode "y" 'spacemeow/paste-command-from-edit-buffer)
  (define-key term-mode-map (kbd "C-f") 'spacemeow/adjust-cursor))


(defun spacemeow/select-term (selected-term-buffer)
  "Select multi-term buffer"
  (interactive
   (let ((multi-term-list (mapcar 'buffer-name multi-term-buffer-list)))
     (list (ido-completing-read "Switch to term: " multi-term-list))))
  (switch-to-buffer selected-term-buffer)
  (goto-char (point-max)))

(defun spacemeow/rename-term-buffer (new-name)
  "Rename buffer of current multi-term"
  (interactive "sTerm name: ")
  (rename-buffer (format "*Multi-term: %s*" new-name) t))

(defun spacemeow/copy-last-command-to-edit-buffer ()
  "Edit current command"
  (interactive)
  (progn
    (goto-char (point-max))
    (beginning-of-line)
    (while (not (char-equal (char-after) ?$))
      (beginning-of-line 1))

    (let ((term-buffer (current-buffer))
          (edit-buffer (get-buffer-create "spacemeow-edit-buffer"))
          (command-beg (+ (line-beginning-position) 1))
          (command-end (line-end-position)))
      (switch-to-buffer edit-buffer)
      (erase-buffer)
      (insert-buffer-substring-no-properties term-buffer command-beg command-end))))

(defun spacemeow/paste-command-from-edit-buffer ()
  "Paste edited command from edit buffer"
  (interactive)
  (let ((edited-command nil))
    (with-current-buffer "spacemeow-edit-buffer"
      (setq edited-command (buffer-string)))
    (term-send-raw-string "\C-u")
    (term-send-raw-string edited-command)))

(defun spacemeow/adjust-cursor ()
  "Adjust cursor to corrct position."
  (interactive)
  (goto-char (point-max))
  (beginning-of-line)
  (while (not (char-equal (char-after) ?$))
    (beginning-of-line 1))
  (forward-char))
