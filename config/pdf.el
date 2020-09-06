(use-package doc-view
  :ensure t
  :config
  (add-hook 'doc-view-mode-hook 'auto-revert-mode))
  ;(define-key doc-view-mode-map "j" 'doc-view-next-page)
  ;(define-key doc-view-mode-map "k" 'doc-view-previous-page)
