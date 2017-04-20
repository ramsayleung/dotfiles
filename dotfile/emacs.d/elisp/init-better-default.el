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

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


(setq ivy-use-virtual-buffers t)

(setq make-backup-files nil)
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8sa" "samray")
 					    ))

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

;;; Changing Ediff options
;;; use window instead of weird frame
(require 'ediff)
(csetq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; changing ediff key binding
(defun samray/ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))

(add-hook 'ediff-mode-hook 'samray/ediff-hook)

;;; when quit an Ediff session, it just leaves the two diff windows around,
;;; instead of restoring the window configuration from when Ediff was started
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; -*- lexical-binding: t -*-
(defun samray/ediff-files ()
  "Ediff in 'dired-mode'."
  (interactive)
  (let ((files (dired-get-marked-files))
        (wnd (current-window-configuration)))
    (if (<= (length files) 2)
        (let ((file1 (car files))
              (file2 (if (cdr files)
                         (cadr files)
                       (read-file-name
                        "file: "
                        (dired-dwim-target-directory)))))
          (if (file-newer-than-file-p file1 file2)
              (ediff-files file2 file1)
            (ediff-files file1 file2))
          (add-hook 'ediff-after-quit-hook-internal
                    (lambda ()
                      (setq ediff-after-quit-hook-internal nil)
                      (set-window-configuration wnd))))
      (error "No more than 2 files should be marked"))))


(provide 'init-better-default)
;;; init-better-default.el ends here
