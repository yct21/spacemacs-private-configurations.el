(defun spacemeow/init-multiple-cursors ()
  (use-package multiple-cursors-mode
    :defer t

    :config
    (spacemeow//config-multiple-cursors-hydra)))

(with-eval-after-load 'hydra
  (defhydra hydra-multiple-cursors (:hint nil)
    "
           ^Up^            ^Down^        ^Other^
      ----------------------------------------------
      [_p_]   Next    [_n_]   Next    [_l_] Edit lines
      [_P_]   Skip    [_N_]   Skip    [_a_] Mark all
      [_M-p_] Unmark  [_M-n_] Unmark  [_r_] Mark by regexp
      ^ ^             ^ ^             [_q_] Quit
      "
    ("l" mc/edit-lines :exit t)
    ("a" mc/mark-all-like-this :exit t)
    ("n" mc/mark-next-like-this)
    ("N" mc/skip-to-next-like-this)
    ("M-n" mc/unmark-next-like-this)
    ("p" mc/mark-previous-like-this)
    ("P" mc/skip-to-previous-like-this)
    ("M-p" mc/unmark-previous-like-this)
    ("r" mc/mark-all-in-region-regexp :exit t)
    ("q" nil)))

(defun spacemeow//config-multiple-cursors-hydra ()
  (spacemacs/set-leader-keys "om" 'hydra-multiple-cursors/body))