(require 'redo+)
(require 'text-utils)

(autoload 'dired-jump-other-window "dired-x"
       "Directory edit in other window." t)

;; Keymaps
(defvar common-mode-map
 (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-f") 	'backward-char)
	(define-key map (kbd "C-j") 	'forward-char)
	(define-key map (kbd "M-f") 	'backward-word)
	(define-key map (kbd "M-j") 	'forward-word)
	(define-key map (kbd "C-M-f") 	'move-beginning-of-line)
	(define-key map (kbd "C-M-j") 	'move-end-of-line)

	(define-key map [C-i] 		'previous-line)
	(define-key map [C-m] 		'next-line)
	(define-key map (kbd "M-i") 	'scroll-down-command)
	(define-key map (kbd "M-m") 	'scroll-up-command)
	(define-key map (kbd "C-M-i") 	'scroll-down-other-window-command)
	(define-key map (kbd "C-M-m") 	'scroll-up-other-window-command)

	(define-key map (kbd "<home>") 	'beginning-of-buffer)
	(define-key map (kbd "<end>") 	'end-of-buffer)

	(define-key map (kbd "C-n")	'open-next-line)
	(define-key map (kbd "M-n")	'open-previous-line)
	(define-key map (kbd "C-z") 	'undo)
	(define-key map (kbd "C-y") 	'redo)
	(define-key map (kbd "C-x") 	'xah-cut-line-or-region)
	(define-key map (kbd "C-c") 	'xah-copy-line-or-region)
	(define-key map (kbd "C-v") 	'yank)
	(define-key map (kbd "C-M-v") 	'yank-pop)
	(define-key map (kbd "C-d")	'delete-backward-char)
	(define-key map (kbd "C-k")	'delete-char)
	(define-key map (kbd "M-d")	'backward-kill-word)
	(define-key map (kbd "M-k")	'kill-word)
	(define-key map (kbd "C-M-d")	'backward-kill-line)
	(define-key map (kbd "C-M-k")	'kill-line)
	(define-key map (kbd "C-S-i") 	'move-line-up)
	(define-key map (kbd "C-S-m") 	'move-line-down)

	(define-key map (kbd "C-o") 	'occur)
	(define-key map (kbd "C-s")	'isearch-forward-word)
	(define-key map (kbd "C-h") 	'query-replace)

	(define-key map (kbd "M-e") 	'find-file)
	(define-key map (kbd "C-M-e") 	'find-file-other-window)
	(define-key map (kbd "M-s")	'save-buffer)
	(define-key map (kbd "M-c")	'kill-this-buffer)
	(define-key map (kbd "C-r")	'revert-buffer)
	(define-key map (kbd "M-w")	'other-window)
	(define-key map (kbd "M-,")  	'xah-previous-user-buffer)
	(define-key map (kbd "M-.")  	'xah-next-user-buffer)
	(define-key map (kbd "M-b")	'buffer-menu)

	(define-key map (kbd "M-r")	'shell-command)
	(define-key map (kbd "C-e")	'execute-extended-command)
	(define-key map (kbd "M-q")	'save-buffers-kill-terminal)
	(define-key map (kbd "M-a")	'iconify-frame)
	(define-key map (kbd "C-S-k")	'describe-key)

	(define-key map (kbd "C-t")	'shell)
	(define-key map (kbd "C-g") 	'dired-jump-other-window)	
 map)
"The common keymap.")

(define-minor-mode common-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter "Common keys")

(provide 'common-mode)