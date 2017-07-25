
(setq inhibit-startup-screen t)

(defvar current-dir (file-name-directory (or load-file-name (buffer-file-name))))
(let* ((scripts-dir (concat current-dir "Scripts/"))
       (default-directory scripts-dir)
       (orig-load-path load-path))
  (setq load-path (cons scripts-dir nil))
  (normal-top-level-add-subdirs-to-load-path)
  (nconc load-path orig-load-path))

(require 'config)