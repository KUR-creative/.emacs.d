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
