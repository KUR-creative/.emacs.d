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

(defun run-mypy ()
  "run mypy"
  (interactive)
  (save-some-buffers t)
  (let ((default-directory (locate-dominating-file "." "main.py")))
    (async-shell-command "mypy --show-error-code .")))

(defun run-this ()
  "run python file in current buffer"
  (interactive)
  (save-some-buffers t)
  (async-shell-command (concat "python '" (buffer-file-name)"'")))

(define-key python-mode-map (kbd "<f5>") 'run-main)
(define-key python-mode-map (kbd "<f4>") 'run-this)
(define-key python-mode-map (kbd "<f8>") 'run-pytest)
(define-key python-mode-map (kbd "<f3>") 'run-pytest)
(define-key python-mode-map (kbd "<f9>") 'run-mypy)

(add-hook 'inferior-python-mode-hook 'toggle-truncate-lines)
