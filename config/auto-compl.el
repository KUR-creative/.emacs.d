(use-package company
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode))
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  ;;TODO ; <- Could be colored?
  ;; file path completion 
  ;; in-buffer completion 
  ;(company-indent-or-complete-common (kbd "TAB"))
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  )
