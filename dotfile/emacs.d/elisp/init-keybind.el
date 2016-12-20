
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-c a" ) 'org-agenda)
(global-set-key "\C-s" 'swiper)
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
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)

;; dynamically change indent from 4 to 2 ,or from 2 to 4
(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(with-eval-after-load 'dired-mode
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
;; open my init.el file
(global-set-key (kbd "<f1>") 'open-my-file)
(global-set-key (kbd "M-s o") 'occur-dwim)
(global-set-key (kbd "M-s e") 'iedit-mode)
(global-set-key (kbd "C-=") 'er/expand-region)

;; r refer to remember
(global-set-key (kbd "C-c r") 'org-capture-templates)

(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)

(provide 'init-keybind)
