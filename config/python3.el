(require 'python)

(defun run-main ()
  "run main.py"
  (interactive)
  (save-some-buffers t)
  (let ((default-directory (locate-dominating-file "." "main.py")))
    (async-shell-command "python main.py")))

(defun run-pytest ()
  "run pytest"
  (interactive)
  (save-some-buffers t)
  (let ((default-directory (locate-dominating-file "." "main.py")))
    (async-shell-command "pytest -vv")))

(defun run-this ()
  "run python file in current buffer"
  (interactive)
  (save-some-buffers t)
  (async-shell-command (concat "python '" (buffer-file-name)"'")))

(define-key python-mode-map (kbd "<f5>") 'run-main)
(define-key python-mode-map (kbd "<f4>") 'run-this)
(define-key python-mode-map (kbd "<f8>") 'run-pytest)

(add-hook 'inferior-python-mode-hook 'toggle-truncate-lines)
