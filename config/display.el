(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;(toggle-truncate-lines)
(set-default 'truncate-lines t)

(global-display-line-numbers-mode) ;emacs 26
;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;(add-hook 'prog-mode-hook 'toggle-truncate-lines)
(setq scroll-step 1)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)

(global-set-key (kbd "<f2>") 'dired)

;1111111112222222223333333333444444444455555555556666666666777777777788888

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 105
                    :weight 'normal
                    :width 'normal)

(use-package hl-todo
  :hook ((prog-mode . hl-todo-mode)
         (text-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("REFACTOR"   warning bold)
          ("FIXME"      error bold)
          ("WARNING"    error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("THINK"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))
