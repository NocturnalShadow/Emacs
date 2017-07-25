(require 'ido)

;; Drag a line
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;; Cut
(defun xah-cut-line-or-region ()
  "Cut current line, or text selection."
  (interactive)
  (if current-prefix-arg
      (progn ; not using kill-region because we don't want to include previous kill
        (kill-new (buffer-string))
        (delete-region (point-min) (point-max)))
    (progn (if (use-region-p)
               (kill-region (region-beginning) (region-end) t)
             (kill-region (line-beginning-position) (line-beginning-position 2))))))

;; Copy 
(defun xah-copy-line-or-region ()
  "Copy current line, or text selection. When called repeatedly, append copy subsequent lines."
  (interactive)
  (let (-p1 -p2)
    (if current-prefix-arg
        (setq -p1 (point-min) -p2 (point-max))
      (if (use-region-p)
          (setq -p1 (region-beginning) -p2 (region-end))
        (setq -p1 (line-beginning-position) -p2 (line-end-position))))
    (if (and
         (eq last-command this-command)
         (eq (point) (get this-command 'xl-last-cursor-pos)))
        (progn
          ;; (end-of-line)
          ;; (forward-char)
          ;; (push-mark (point) "NOMSG" "ACTIVATE")
          (kill-append "\n" nil)
          (kill-append (buffer-substring-no-properties (line-beginning-position) (line-end-position)) nil)
          (message "Line copy appended"))
      (progn
        (kill-ring-save -p1 -p2)
        (if current-prefix-arg
            (message "Buffer text copied")
          (message "Text copied"))))
    (when (not (region-active-p))
      (end-of-line)
      (forward-char)))
  (put this-command 'xl-last-cursor-pos (point)))

;; <Enter>
(defun open-next-line (arg)
	"Move to the next line and then opens a line."
     	(interactive "p")
      	(open-line arg)
      	(next-line 1)
	(beginning-of-line)
	(indent-according-to-mode)
)

;; Create a new line above current
(defun open-previous-line (arg)
      	"Open a new line before the current one."
      	(interactive "p")
      	(beginning-of-line)
      	(open-line arg)
)

;; Deletes a part of a line form the beggining to the cursor position
(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; Switch to the next buffer
(defun xah-next-user-buffer ()
  "Switch to the next user buffer.
“user buffer” is determined by `xah-user-buffer-q'."
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

;; Switch to the previous buffer
(defun xah-previous-user-buffer ()
  "Switch to the previous user buffer.
“user buffer” is determined by `xah-user-buffer-q'."
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

;; Determines which buffer is visible for the switch
(defun xah-user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
Typically, if buffer name starts with *, it's not considered a user buffer.
This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
You can override this function to get your idea of “user buffer”."
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
        nil
     t)))

(provide 'text-utils)