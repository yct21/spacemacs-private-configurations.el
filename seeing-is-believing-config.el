;;;; Funcs for seeing is believing and its keybindings

(defun spacemeow/seeing-is-believing-run (&optional flags)
  "Run seeing_is_believing on the currently selected buffer or region.
Optional FLAGS are passed to the seeing_is_believing command."
  (interactive)
  (let ((beg (if (region-active-p) (region-beginning) (point-min)))
        (end (if (region-active-p) (region-end) (point-max)))
        (origin (point)))
    (shell-command-on-region beg end (concat seeing-is-believing-executable " " flags) nil 'replace)
    (goto-char origin)))

(defun spacemeow/seeing-is-believing-run-as-xmpfilter ()
  "Run seeing_is_believing with -x to replicate the behaviour of xmpfilter."
  (interactive)
  (seeing-is-believing-run "-x"))

(defun spacemeow/seeing-is-believing-clear ()
  "Clear any output from seeing_is_believing from the buffer or region."
  (interactive)
  (seeing-is-believing-run "-c"))

(defun spacemeow/seeing-is-believing-mark-current-line-for-xmpfilter ()
  "Add the characters \"# =>\" to the end of the current line in order to mark it for xmpfilter run."
  (interactive)
  (save-excursion
    (end-of-line)
    (insert " # =>")))

(spacemacs/set-leader-keys-for-major-mode 'ruby-mode "oe" 'spacemeow/seeing-is-believing-run)
(spacemacs/set-leader-keys-for-major-mode 'ruby-mode "oE" 'spacemeow/seeing-is-believing-run-as-xmpfilter)
(spacemacs/set-leader-keys-for-major-mode 'ruby-mode "ot" 'spacemeow/seeing-is-believing-mark-current-line-for-xmpfilter)
(spacemacs/set-leader-keys-for-major-mode 'ruby-mode "oc" 'spacemeow/seeing-is-believing-clear)
