
(defvar my-shell-mode-map
 (let ((map (make-sparse-keymap)))
	(define-key map (kbd "C-t")	'delete-window)
 map)
"The shell keymap.")

(define-minor-mode my-shell-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value nil
  :lighter "Shell keys")

(defun on-shell-mode ()
	(my-shell-mode 1)
	(setq mode-line-format nil)
)

(add-hook 'shell-mode-hook 		'on-shell-mode)

(provide 'shell-mode)