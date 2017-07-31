(require 'ls-lisp-modified)

(defun dired-window () 
	(nth 1 (window-list)))

(defun dired-select (&rest args)
       	(interactive "P")
	(let ((find-file-run-dired t)
	      (file (dired-get-file-for-visit)))
       	(if (file-directory-p file)
	    (call-interactively 'dired-find-file args)
	    (let ((dired-window (dired-window)))
	      (set-window-buffer dired-window
				 (find-file-noselect 
				  (dired-get-file-for-visit)))
	      (select-window dired-window))
	  ))
)

;(wdired-change-to-wdired-mode)

(defvar diredit-mode-map
	(let ((map (make-sparse-keymap)))
		(define-key map (kbd "C-g")		'delete-window)
		(define-key map [(return)] 		'dired-select)
		(define-key map [(shift return)] 	'dired-find-file-other-window)
	map)
"Directory edit keymap.")

(define-minor-mode diredit-mode
	"A minor mode so that my key settings override annoyin major modes."
	:init-value nil
	:lighter "Diredit keys")

(defun on-dired-load ()
	(setq dired-listing-switches "-laGh1v")
)

(defun on-dired-mode ()
	(if (memq 'uid ls-lisp-verbosity)
          (progn
            (setq ls-lisp-verbosity (delq 'uid ls-lisp-verbosity))
            (setq ls-lisp-verbosity (delq 'gid ls-lisp-verbosity))
	  ))
	(setq ls-lisp-format-time-list  
		'("%d/%m/%Y %H:%M" "%d/%m/%Y %H:%M") 
		ls-lisp-use-localized-time-format 
		t)
	(diredit-mode 1)
)

(add-hook 'dired-load-hook	'on-dired-load)
(add-hook 'dired-mode-hook	'on-dired-mode)

(defun fixed-ls-line (str)
  (setq tokens (split-string (substring str 13)))
  (format "%-15s %15s %-8s  %-10s\n" (nth 3 tokens) (nth 1 tokens) (nth 2 tokens) (nth 0 tokens)) 
)

(defadvice ls-lisp-format (around my-ls-lisp-format 
  (file-name file-attr file-size switches time-index))
  (progn
    ad-do-it
    	(setq ad-return-value (fixed-ls-line ad-return-value))
))

(ad-activate 'ls-lisp-format t)

(provide 'diredit-mode)
