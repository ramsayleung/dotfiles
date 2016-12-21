;;; package --- summary
;;; code:
;;; Commentary:
;; global-set-key module
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c a" ) 'org-agenda)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-h l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "<f1>") 'open-my-file);; open my init.el file
(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "M-s e") 'iedit-mode)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "<escape>") 'keyboard-quit) ;; all platforms?
(global-set-key (kbd "C-c r") 'org-capture-templates);;refer to remember
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent) ;; dynamically change indent from 4 to 2 ,or from 2 to 4
;; (global-set-key "\ESC" 'keyboard-escape-quit)         ;; everywhere else

;; define-key module
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
(define-key isearch-mode-map "\e" 'isearch-abort)   ;; \e seems to work better for terminals
(with-eval-after-load 'dired-mode
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;; Evil mode module
(evil-leader/set-key
  "ad" 'dired
  "bb" 'switch-to-buffer
  "bo" 'occur-dwim
  "el" 'flycheck-list-errors 
  "en" 'flycheck-next-error 
  "ep" 'flycheck-previous-error
  "ff" 'find-file
  "fr" 'recentf-open-files
  "fs" 'save-buffer
  "fed" 'open-my-file
  "gs" 'magit-status
  "oa" 'org-agenda
  "ps" 'helm-ag-project-root
  "ss" 'swiper
  "si" 'iedit-mode
  "v" 'er/expand-region
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "wd" 'delete-window
  "wD" 'delete-other-windows
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  ;;";;" 'evilnc-comment-or-uncomment-lines
  )

;; Misc
(js2r-add-keybindings-with-prefix "C-c C-m")
(provide 'init-keybindings)
;;; init-keybindings.el ends here
