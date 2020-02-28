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
