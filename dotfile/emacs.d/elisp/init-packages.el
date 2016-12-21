
;;; Code:
;;; Commentary:
;;; package --- Summary:

;;require future
(require 'popwin)

(package-initialize)
;;(when (>= emacs-major-version 24)
;;  (require 'package)
;;  (package-initialize)
;;  (add-to-list 'package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;;				   ("melpa" . "http://elpa.emacs-china.org/melpa/")) t))
(when (>= emacs-major-version 24)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/")))
  )

(defvar my/packages '(;;org
		      org-pomodoro
		      ;; ---  evil --- 
		      evil
		      evil-leader
		      evil-surround
		      evil-nerd-commenter
		      powerline-evil
		      ;; --- Auto-completion ---
		      company
		      ;; --syntax checker
		      flycheck 
		      ;; --search
		      helm-ag
		      ;; --- Better Editor ---
		      window-numbering
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      expand-region
		      iedit
		      which-key
		      dired+
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
		      dracula-theme
		      molokai-theme
		      ;; solarized-theme
		      ) "Default package")


(setq package-selected-packages my/packages)

;; function module
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



;; config for web-mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offset 2) ;web-mode,html tag in html file
  (setq web-mode-css-indent-offset 2)	 ;web-mode,css in html file
  (setq web-mode-code-indent-offset 2)	 ;web-mode ,js code in html files
  )

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

;; add-hook module
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
(add-hook 'js2-mode-hook 'js2-refactor-mode)

;;global enable mode module
(global-flycheck-mode)
(smartparens-global-mode t)
(global-company-mode 1)

;;enable mode module
(window-numbering-mode 1) 
(popwin-mode t)
(which-key-mode t)   
(diredp-toggle-find-file-reuse-dir t)

;;misc module
;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; show single quote "'" in emacs and lisp-interaction-mode instead of single quote pair "''"
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; reload all snippet and rebuild yasippet menu
;;(yas-reload-all) 
(provide 'init-packages)
;;; init-packages ends here
