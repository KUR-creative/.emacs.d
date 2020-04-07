(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (progn (setq markdown-command "pandoc -f gfm")
	       (bind-key (kbd "<f4>") 'markdown-preview)))
