
(defvar minibuffer-mode-map
 (let ((map (make-sparse-keymap)))
	(define-key map (kbd "M-e") 	'kill-this-buffer)
 map)
"The minibuffer keymap.")

(define-minor-mode minibuffer-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value nil
  :lighter "Minibuffer keys")

(defun on-minibuffer-setup ()
	(minibuffer-mode 1)
)

(add-hook 'minibuffer-setup-hook 	'on-minibuffer-setup)

(provide 'minibuffer-mode)