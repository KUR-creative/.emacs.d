(use-package doc-view
  :ensure t
  :config
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (define-key doc-view-mode-map (kbd "C-h") 'windmove-left)
  (define-key doc-view-mode-map (kbd "C-j") 'windmove-down)
  (define-key doc-view-mode-map (kbd "C-k") 'windmove-up)
  (define-key doc-view-mode-map (kbd "C-l") 'windmove-right))
 ;(define-key doc-view-mode-map "j" 'doc-view-next-page)
 ;(define-key doc-view-mode-map "k" 'doc-view-previous-page)
