(require 'alert)

(defun spacemeow/notify-appt (remain-time current-time text)
  (alert text :title "org-agenda reminder")
  )

(setq appt-display-diary nil)
(setq appt-disp-window-function 'spacemeow/notify-appt)
(setq appt-delete-window-function 'ignore)
