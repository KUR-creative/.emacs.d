(defun set-js-indent=2 ()
  (interactive)
  (setq-local js-indent-level 2))
(add-hook 'js-mode-hook 'set-js-indent=2)

(defun set-js2-indent=2 ()
  (interactive)
  (setq-local js2-basic-offset 2))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook 'set-js2-indent=2))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))

(use-package prettier-js
  :ensure t
  :config
  (setq prettier-js-args '("--print-width" "70")))
