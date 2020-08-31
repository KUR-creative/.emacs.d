(require 'cc-mode)

(setq-default c-basic-offset 4)

(defun make-to-build ()
  "Run make"
  (interactive)
  (save-some-buffers t)
  (async-shell-command "make"))
  
(define-key c-mode-map (kbd "<f4>") 'make-to-build)
