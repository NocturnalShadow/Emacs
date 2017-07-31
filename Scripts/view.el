(require 'powerline)
(require 'popwin)

;; Enable popping up windows
(popwin-mode 1)

(defun maximize-frame ()
	(add-to-list 'default-frame-alist '(fullscreen . maximized)))

(defun post-load ()
	(interactive)
	(tool-bar-mode 0)
	(menu-bar-mode -1)			; No menubar
	(scroll-bar-mode -1)			; No scrollbar
	(global-hl-line-mode t)			; Highlight cursor line
	(set-foreground-color "burlywood3")
	(set-background-color "#161616")
	(set-cursor-color "#40FF40"))

;; View
(maximize-frame)				; Fullscreen mode
(split-window-horizontally)			; Two windows mode

(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)

(add-hook 'window-setup-hook 'post-load t)	; Final visuals

;; Clock
(display-time)

;; Display line numbers
(define-global-minor-mode almost-global-linum-mode linum-mode
  (lambda () 
    (when (not (memq major-mode
		     (list 'shell-mode 'dired-mode)))
      (linum-mode))))

(almost-global-linum-mode 1)

;; Make directory edit window pop on top
(push '(dired-mode :position top) popwin:special-display-config)

(provide 'view)
