(defun compile-main-with-bib ()
  "Compile main.tex in top level, then Generate pdf file 
   that has biblography."
  (interactive)
  (save-some-buffers t)
  (let ((default-directory (locate-dominating-file "." "main.tex")))
    (async-shell-command
     "pdflatex main.tex; bibtex main; pdflatex main.tex; pdflatex main.tex")))

(defun compile-main ()
  "Compile main.tex in top level, do nothing about bib."
  (interactive)
  (save-some-buffers t)
  (let ((default-directory (locate-dominating-file "." "main.tex")))
    (async-shell-command "pdflatex main.tex")))

(defun compile-this ()
  "Compile current buffer."
  (interactive)
  (save-some-buffers t)
  (async-shell-command (concat "pdflatex '" (buffer-file-name) "'")))
  
(use-package tex-mode
  :ensure t
  :config
  (define-key tex-mode-map (kbd "<f8>") 'compile-main-with-bib)
  (define-key tex-mode-map (kbd "<f5>") 'compile-main)
  (define-key tex-mode-map (kbd "<f4>") 'compile-this))
