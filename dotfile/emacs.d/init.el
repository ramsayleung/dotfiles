;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; cl - Common Lisp Extension

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'cl)

(require 'init-packages)
(require 'init-ui)
(require 'init-keybind)
(require 'init-better-default)
(require 'init-org)

(setq custom-file (expand-file-name "elisp/custom.el" user-emacs-directory))
(load-file custom-file)
