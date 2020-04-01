(require 'typescript)

(defun run-test ()
  "run test"
  (interactive)
  (save-some-buffers t)
  (async-shell-command "yarn test"))

(define-key typescript-mode-map (kbd "<f4>") 'run-test)

(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
