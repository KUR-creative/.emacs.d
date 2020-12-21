(require 'paredit)

;; ----------------------------------------------------------------------
;; ParEdit evil bindings

;; Structural Navigation
(define-key evil-normal-state-map (kbd "M-k") 'paredit-backward-up)
(define-key evil-insert-state-map (kbd "M-k") 'paredit-backward-up)
(define-key evil-normal-state-map (kbd "M-j") 'paredit-forward-down)
(define-key evil-insert-state-map (kbd "M-j") 'paredit-forward-down)
(define-key evil-normal-state-map (kbd "M-h") 'paredit-backward)
(define-key evil-insert-state-map (kbd "M-h") 'paredit-backward)
(define-key evil-normal-state-map (kbd "M-l") 'paredit-forward)
(define-key evil-insert-state-map (kbd "M-l") 'paredit-forward)

;; Slup & Barf
(define-key evil-normal-state-map (kbd "C-S-l") 'paredit-forward-slurp-sexp)
(define-key evil-insert-state-map (kbd "C-S-l") 'paredit-forward-slurp-sexp)
(define-key evil-normal-state-map (kbd "C-S-h") 'paredit-forward-barf-sexp)
(define-key evil-insert-state-map (kbd "C-S-h") 'paredit-forward-barf-sexp)
