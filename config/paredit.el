(require 'paredit)

;; ----------------------------------------------------------------------
;; ParEdit evil bindings

;; Structural Navigation
;; normal
(define-key evil-normal-state-map (kbd "M-k") 'paredit-backward-up)
(define-key evil-normal-state-map (kbd "M-j") 'paredit-forward-down)
(define-key evil-normal-state-map (kbd "M-h") 'paredit-backward)
(define-key evil-normal-state-map (kbd "M-l") 'paredit-forward)
;; insert
(define-key evil-insert-state-map (kbd "M-k") 'paredit-backward-up)
(define-key evil-insert-state-map (kbd "M-j") 'paredit-forward-down)
(define-key evil-insert-state-map (kbd "M-h") 'paredit-backward)
(define-key evil-insert-state-map (kbd "M-l") 'paredit-forward)
