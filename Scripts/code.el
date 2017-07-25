
;; Make return key also do indent, for current buffer only
;(electric-indent-local-mode 1)
;(electric-indent-mode 1)

;; Make tab key call indent command or insert tab character, depending on cursor position
;(setq-default tab-always-indent nil)
;(setq tab-always-indent 'complete)

;; Automaticaly insert a second bracket
(electric-pair-mode 1)

;; Make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            (?\" . ?\")
                            (?\{ . ?\})
                            ) )

;; C and C++
(setq 	c-default-style "linux"
	c-basic-offset 4)

(provide 'code)