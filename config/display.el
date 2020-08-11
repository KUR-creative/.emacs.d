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

;111111111222222222333333333344444444445555555555666666666677777
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)
