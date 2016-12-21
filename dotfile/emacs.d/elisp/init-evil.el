;;; package --- Summary
;;; Code:
;;; Commentary:
(evil-mode 1)
(require 'evil-surround)
(global-evil-surround-mode)
(global-evil-leader-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(evilnc-default-hotkeys)
(with-eval-after-load 'evil-mode
  (define-key evil-normal-state-map (kbd "SPC ; ;") 'evilnc-comment-or-uncomment-lines)
  (define-key evil-visual-state-map (kbd "SPC ; ;") 'evilnc-comment-or-uncomment-lines))

(provide 'init-evil)
;;; init-evil.el ends here
