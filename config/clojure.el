(require 'cider)
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

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
;; follows: https://docs.cider.mx/cider/0.26/usage/cider_mode.html
(evil-define-key 'normal clojure-mode-map (kbd "mck") 'cider-load-buffer)
(evil-define-key 'normal clojure-mode-map (kbd "mcz") 'cider-switch-to-repl-buffer)
;; evals
(evil-define-key 'normal clojure-mode-map (kbd "mcc") 'cider-eval-defun-at-point)
(evil-define-key 'normal clojure-mode-map (kbd "mce") 'cider-eval-last-sexp)
(evil-define-key 'normal clojure-mode-map (kbd "mcb") 'cider-interrupt)
(evil-define-key 'normal clojure-mode-map (kbd "mcvw") 'cider-eval-last-sexp-and-replace)
(evil-define-key 'normal clojure-mode-map (kbd "me") 'cider-eval-last-sexp-to-repl) ; C-c M-e
;; test
(evil-define-key 'normal clojure-mode-map (kbd "mctt") 'cider-test-run-test)
(evil-define-key 'normal clojure-mode-map (kbd "mcta") 'cider-test-rerun-test)
(evil-define-key 'normal clojure-mode-map (kbd "mctn") 'cider-test-run-ns-tests)
(evil-define-key 'normal clojure-mode-map (kbd "mctl") 'cider-test-run-loaded-tests)
(evil-define-key 'normal clojure-mode-map (kbd "mctp") 'cider-test-run-project-tests)
(evil-define-key 'normal clojure-mode-map (kbd "mctr") 'cider-test-rerun-failed-tests)
(evil-define-key 'normal clojure-mode-map (kbd "mctb") 'cider-test-show-report)
;; Reloading code:  https://docs.cider.mx/cider/0.26/usage/misc_features.html#reloading-code
(evil-define-key 'normal clojure-mode-map (kbd "mcnr") 'cider-ns-refresh)

;; my evals: eval-this
;(defun clj/eval-current-sexp () (interactive)


;; docs
(evil-define-key 'normal clojure-mode-map (kbd "mcdd") 'cider-doc)
(evil-define-key 'normal clojure-mode-map (kbd "mcdj") 'cider-javadoc)
(evil-define-key 'normal clojure-mode-map (kbd "mcdw") 'cider-clojuredocs-web)

;; follows: https://docs.cider.mx/cider/0.26/repl/keybindings.html
(evil-define-key 'normal cider-repl-mode-map (kbd "mcz") 'cider-switch-to-repl-buffer)
;; If you have time, check: https://github.com/abo-abo/hydra


;; 이게 왜 필요하냐면... trailing whitespace를 만들어야 last-sexp을 잘 쓸 수 있거든...
;; 이 방법이 그나마 제일 쉬운 듯...
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ----------------------------------------------------------------------
;; Enable ParEdit
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
