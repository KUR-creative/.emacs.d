(require 'cider)

(setq-default cider-save-file-on-load t) ;just save without prompting

(defun clj/save-eval-test-all ()
  "Save, evaluate, and test all in project.
  saving is automatically with load(eval),
  loading is done by `cider-load-all-files`,
  finally, command-execute `cider-test-run-project-tests`. "
  (interactive)
  (let* ((root-dir (locate-dominating-file "." "project.clj"))
	 (src-dir  (concat root-dir (file-name-as-directory "src")))
	 (test-dir (concat root-dir (file-name-as-directory "test"))))
    (cider-load-all-files src-dir)
    (cider-load-all-files test-dir))
  (command-execute 'cider-test-run-project-tests))

(define-key clojure-mode-map (kbd "<f4>") 'cider-load-buffer)
;(define-key clojure-mode-map (kbd "<f5>") 'clj/save-eval-all)
(define-key clojure-mode-map (kbd "<f8>") 'clj/save-eval-test-all)

;; ----------------------------------------------------------------------
;; Cider evil bindings

;; It follows CIDER's default bindings. 
;; C-c C-k => mck
;; C-c C-c => mcc
;; ref: https://emacs.stackexchange.com/questions/31390/how-to-define-mode-specific-keys-in-evil-mode

(require 'evil)
(evil-define-key 'normal clojure-mode-map (kbd "mck") 'cider-load-buffer)
(evil-define-key 'normal clojure-mode-map (kbd "mcc") 'cider-eval-defun-at-point)
(evil-define-key 'normal clojure-mode-map (kbd "mce") 'cider-eval-last-sexp)
(evil-define-key 'normal clojure-mode-map (kbd "mcb") 'cider-interrupt)
;; If you have time, check: https://github.com/abo-abo/hydra
