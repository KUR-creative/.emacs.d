;; point means cursor in emacs

(require 'evil)
(evil-mode 1)

;;----------------------------------------------------------------
;; kemaps
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right) 
(defun insert-space-after-point () (interactive)
  (progn (forward-char) (insert " ") (backward-char)))
(define-key evil-normal-state-map " " 'insert-space-after-point)

(define-key evil-insert-state-map (kbd "C-h") 'delete-backward-char)

(defun open-line-with-point () (interactive)
  (let ((oldpos (point))) (end-of-line) (newline-and-indent)))
(define-key evil-normal-state-map
  (kbd "RET") 'open-line-with-point)

;;----------------------------------------------------------------
;; custom commands
(evil-tabs-mode 1)
(global-evil-tabs-mode 1)
(evil-define-command evil-tab-sensitive-quit (&optional bang)
   :repeat nil
   (interactive "<!>")
   (if (> (length (elscreen-get-screen-list)) 1)
       (if (> (length (window-list)) 1)
           (evil-quit)
           (elscreen-kill))
       (evil-quit bang)))

(defvar my-leader-map (make-sparse-keymap) "evil leader keymap")
(use-package evil-magit
  :config
  ;; gi: open magit status
  (define-key evil-normal-state-map "g" my-leader-map)
  (define-key my-leader-map "i" 'magit-status)
  ;; status mode
  (define-key magit-status-mode-map "j" 'magit-section-forward)  ; n -> j
  (define-key magit-status-mode-map "k" 'magit-section-backward) ; p -> k
  (define-key magit-status-mode-map "J" 'magit-status-jump)      ; j -> J
  (define-key magit-status-mode-map "x" 'magit-delete-thing)     ; k -> x
  ;; diff mode
  (define-key magit-diff-mode-map "j" 'magit-section-forward)          ; n -> j
  (define-key magit-diff-mode-map "k" 'magit-section-backward)         ; p -> k
  (define-key magit-diff-mode-map "J" 'magit-jump-to-diffstat-or-diff) ; j -> J
  (define-key magit-diff-mode-map "x" 'magit-delete-thing)             ; k -> x
  )

(setq-default evil-symbol-word-search t)
(setq-default evil-search-module 'evil-search)


(add-to-list 'evil-emacs-state-modes 'fundamental-mode) ;; Disable evli in *cider-error*
;(add-to-list 'evil-emacs-state-modes 'help-mode)
