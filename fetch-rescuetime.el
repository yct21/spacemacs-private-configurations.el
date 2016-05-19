(require 'cl-lib)

(defun spacemeow/fetch-rescue-time ()
  (interactive)
  (request
   "https://www.rescuetime.com/anapi/data"
   :params `(("key" . ,spacemeow-rescuetime-api-key)
             ("format" . "json")
             ("restrict_begin" . ,(format-time-string "%Y-%m-%d"))
             ("restrict_end" . ,(format-time-string "%Y-%m-%d"))
             ("resolution_time" . "day")
             ("rk" . "productivity"))
   :parser 'json-read
   :error (function* (lambda (&key data &allow-other-keys) (setq spacemeow-rescuetime-score "NA")))
   :success (function*
             (lambda (&key data &allow-other-keys)
               (spacemeow//caculate-productive-score data)))))

(defun spacemeow//caculate-productive-score (raw-data)
  (let* ((rows (cdr (assoc 'rows raw-data)))
         (score-time-list (mapcar (lambda (row) `(,(* (elt row 1) (+ (elt row 3) 2)) ,(elt row 1))) rows))
         (score-time (cl-reduce (lambda (rank total) `(,(+ (elt rank 0) (elt total 0)) ,(+ (elt rank 1) (elt total 1)))) score-time-list))
         (final-score (/ (* (elt score-time 0) 25.0) (elt score-time 1))))
    (setq spacemeow-rescuetime-score final-score)))

(with-eval-after-load 'org-pomodoro
  (require 'request)

  (add-hook 'org-pomodoro-finished-hook 'spacemeow/fetch-rescue-time)
  (add-hook 'org-pomodoro-started-hook 'spacemeow/fetch-rescue-time))
