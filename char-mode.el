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