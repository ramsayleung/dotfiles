(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      magit
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      popwin
		      ;; --- Themes ---
		      monokai-theme
		      zenburn-theme
		      ;; solarized-theme
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(require 'popwin)
(popwin-mode t)
;;(add-hook 'prog-mode' 'smartparens-mode)
(smartparens-global-mode t)
;; code auto-completion
(global-company-mode 1)


(provide 'init-packages)
