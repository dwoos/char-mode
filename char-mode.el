(defvar roll-program "roll.py")

(define-minor-mode char-mode
  "Toggle Character mode.
Character Mode defines a set of functions for
representing RPG characters as org-mode files"
  nil
  " Char"
  '(("\C-c\C-r" . roll-dice)))

(defun roll-dice () 
  (interactive)
  (let ((dice (thing-at-point 'symbol)))
    (if (string-match "<\\([a-z0-9\+\-]*\\)>" dice)
        (let ((acdice (match-string 1 dice)))
          (let (p1 p2)
            (skip-chars-backward "^<")
            (backward-char)
            (setq p1 (point))
            (skip-chars-forward "^>")
            (forward-char)
            (setq p2 (point))
            (delete-region p1 p2)
            (insert (shell-command-to-string (concat roll-program " " acdice)))))
      (shell-command (concat roll-program " " dice)))))

(defun score-to-mod (n)
  (let ((d (- n 10)))
    (cond
     ((< d 0) (/ (- d 1) 2))
     (t (/ d 2)))))

(defun recalc-all-org-tables ()
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (let ((s (search-forward "#+TBLNAME" nil t)))
      (while s
        (next-line)
        (org-table-recalculate '(16))
        (setq s (search-forward "#+TBLNAME" nil t))))))
        