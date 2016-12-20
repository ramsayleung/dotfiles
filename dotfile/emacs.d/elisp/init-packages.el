
;;; Code:
;;; Commentary:
;;; package --- Summary:


(package-initialize)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

(defvar my/packages '(;;org
		      org-pomodoro
		      ;; --- Auto-completion ---
		      company
		      ;; --syntax checker
		      flycheck 
		      ;; --search
		      helm-ag
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      expand-region
		      iedit
		      ;; --- Major Mode ---
		      js2-mode
		      web-mode
		      magit
		      ;; --- Minor Mode ---
		      nodejs-repl
		      exec-path-from-shell
		      popwin
		      js2-refactor
		      ;; --- Themes ---
		      monokai-theme
		      zenburn-theme
		      ;; solarized-theme
		      ) "Default package")


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
      (message "package name:%s" pkg)
      (package-install pkg))))

(require 'popwin)
(popwin-mode t)
;;(add-hook 'prog-mode' 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
;; code auto-completion
(global-company-mode 1)

;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; config for web-mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2) ;web-mode,html tag in html file
  (setq web-mode-css-indent-offset 2)	 ;web-mode,css in html file
  (setq web-mode-code-indent-offset 2)	 ;web-mode ,js code in html files
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (or (eq major-mode 'js-mode)(eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset(if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	(setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	(setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2)  4 2)))
  (setq indent-tabs-mode nil))

(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
(global-flycheck-mode)

(yas-reload-all) 
(add-hook 'prog-mode-hook #'yas-minor-mode)
(provide 'init-packages)
