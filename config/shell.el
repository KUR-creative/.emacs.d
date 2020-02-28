(require 'shell)
;(require 'display-line-numbers)

(add-hook 'shell-mode-hook 'toggle-truncate-lines)
;(add-hook 'shell-mode-hook (lambda () (interactive) (display-line-numbers)))
;(add-hook 'shell-mode-hook #'display-line-numbers-mode)
