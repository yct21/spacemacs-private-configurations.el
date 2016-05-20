(require 'cl-lib)

(defun spacemeow/fetch-wakatime ()
  (interactive)
  (request
   "https://wakatime.com/api/v1/users/current/summaries"
   :params `(("api_key" . ,spacemeow-wakatime-api-key)
             ("start" . ,(format-time-string "%Y-%m-%d"))
             ("end" . ,(format-time-string "%Y-%m-%d")))
   :parser 'json-read
   :error (function* (lambda (&key data &allow-other-keys) (setq spacemeow-wakatime-total "boom")))
   :success (function*
             (lambda (&key data &allow-other-keys)
               (setq spacemeow-wakatime-total (spacemeow//get-wakatime-total data))))))

(defun spacemeow//get-wakatime-total (raw-data)
  (let* ((data-row (aref (cdr (assoc 'data raw-data)) 0))
         (operating-systems (aref (cdr (assoc 'operating_systems data-row)) 0))
         (hours (cdr (assoc 'hours operating-systems)))
         (minutes (cdr (assoc 'minutes operating-systems))))
    (concat
     (if (> hours 0) (format " %sh" hours) "")
     (format " %smin " minutes))))

(with-eval-after-load 'org-pomodoro
  (require 'request)

  (add-hook 'org-pomodoro-finished-hook 'spacemeow/fetch-wakatime)
  (add-hook 'org-pomodoro-started-hook 'spacemeow/fetch-wakatime))
