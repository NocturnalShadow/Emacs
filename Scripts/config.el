
;; Turn the annoying "beep" sound off
(setq ring-bell-function 'ignore)

;; Stop Emacs from losing undo information by
;; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

;; Make typing override selected text
(delete-selection-mode 1)

;; Highlight bracket match
(show-paren-mode 1)

;; Stop creating backup~ files
(setq make-backup-files nil)

;; Stop creating #auto-save# files
(setq auto-save-default nil)

;; Automaticaly refresh file
(global-auto-revert-mode 1)

;; Wrap long lines by word boundary
(global-visual-line-mode 1)

;; Make emacs fullscreen on launch
(toggle-frame-fullscreen)

;; A number of lines in the current buffer
(defvar buffer-line-count nil)
(make-variable-buffer-local 'buffer-line-count)

(defun count-buffer-lines ()
  (setq buffer-line-count (int-to-string (count-lines (point-min) (point-max)))))

(add-hook 'find-file-hook 'count-buffer-lines)
(add-hook 'after-save-hook 'count-buffer-lines)
(add-hook 'after-revert-hook 'count-buffer-lines)
(add-hook 'dired-after-readin-hook 'count-buffer-lines)

;; Smooth scroll
(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;; Dissable query on exit process
(add-hook 'comint-exec-hook 
      (lambda () (set-process-query-on-exit-flag (get-buffer-process (current-buffer)) nil)))

;; These are the same in Emacs, lol
(define-key input-decode-map "\C-i" [C-i])	; TAB and Ctrl + i 
(define-key input-decode-map "\C-m" [C-m])	; RET and Ctrl + m 

(require 'view)
(require 'code)
(require 'modes)

(provide 'config)