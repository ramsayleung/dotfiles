;;; package --- Summary
;;; code:
;;; Commentary:
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(delete-selection-mode t)
;; open init file quickly by binding key
(defun open-my-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(require 'hungry-delete)
;; delete spaces at once
(global-hungry-delete-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(ivy-mode 1)

(evil-mode 1)

(setq ivy-use-virtual-buffers t)

(setq make-backup-files nil)
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8sa" "samray")
 					    ))
;; auto indent file before save file
(defun indent-buffer()
  (interactive)
  (indent-region (point-min)(point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region"))
      (progn
	(indent-buffer)
	(message "Indented buffer")))))
(add-hook 'before-save-hook 'indent-region-or-buffer)

;; enable hippie-mode to enhance auto-completion

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol
					 ))


(fset 'yes-or-no-p 'y-or-n-p)
(setq dired-recursive-copies 'alway)
(setq dired-recursive-deletes 'alway)



(require 'dired-x)

(setq dired-dwim-target t)

;;(define-advice show-paren-funtion (:around (fn) fix-show-paren-function)
;;"Highlight enclosing parens"
;;(cond ((looking-at-p "\\s(")(funcall fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))
;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;  "Highlight enclosing parens."
;;  (cond ((looking-at-p "\\s(") (funcall fn))
;;	(t (save-excursion
;;	     (ignore-errors (backward-up-list))
;;	     (funcall fn)))))
;; remove windows end of line identiter
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)(replace-match "")))



;; dwim=do what i mean

(defun occur-dwim()
  "Call `occur` with a sane default"
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(set-language-environment "UTF-8")

(put 'dired-find-alternate-file 'disabled nil)

(provide 'init-better-default)
;;; init-better-default.el ends here
