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
