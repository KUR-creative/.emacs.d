(package-initialize)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(require 'ivy)
(ivy-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(company-backends
   '((company-dabbrev-code :separate company-capf company-keywords)
     company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
     (company-dabbrev-code company-gtags company-etags company-keywords)
     company-oddmuse company-dabbrev))
 '(custom-enabled-themes '(deeper-blue))
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(docker-tramp hl-todo paredit adjust-parens gnu-elpa-keyring-update elscreen-buffer-group markdown-mode impatient-mode prettier-js typescript tide rainbow-delimiters rjsx-mode js2-mode evil-tabs company use-package-hydra smex evil ivy-explorer))
 '(typescript-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainbow-delimiters-depth-2-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "sienna1")))))

;;----------------------------------------------------------------
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(add-to-list 'load-path "~/.emacs.d/ivy-smex/")
(require 'ivy-smex)
(global-set-key (kbd "M-x") 'ivy-smex)


;;----------------------------------------------------------------
;; You can split init.el with `load-file` function
(defun load-directory (dir)
  (let ((load-it
	 (lambda (f)
	   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el"))))
(load-directory "~/.emacs.d/config")

;; M-: major-mode
(setq-default indent-tabs-mode nil)

;;----------------------------------------------------------------
;(desktop-save-mode 1)

;; Order is important! revive -> elscreen
;; 아마도 elscreen이 이맥스를 느리게 하는 것 같아 제거.
;;(load-file "~/.emacs.d/libs/revive/revive.el")
;;(load-file "~/.emacs.d/libs/elscreen-persist/elscreen-persist.el")

;;(require 'elscreen-persist)
;(elscreen-persist-mode 1)
(setq desktop-files-not-to-save "")


(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))
(setq create-lockfiles nil)

;;----------------------------------------------------------------
(global-set-key (kbd "<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "<f12>") 'quit-window)

;;----------------------------------------------------------------
;; Open files in Docker containers like so: /docker:drunk_bardeen:/etc/passwd
(push
 (cons
  "docker"
  '((tramp-login-program "docker")
    (tramp-login-args (("exec" "-it") ("%h") ("/bin/bash")))
    (tramp-remote-shell "/bin/sh")
    (tramp-remote-shell-args ("-i") ("-c"))))
 tramp-methods)

(defadvice tramp-completion-handle-file-name-all-completions
  (around dotemacs-completion-docker activate)
  "(tramp-completion-handle-file-name-all-completions \"\" \"/docker:\" returns
    a list of active Docker container names, followed by colons."
  (if (equal (ad-get-arg 1) "/docker:")
      (let* ((dockernames-raw (shell-command-to-string "docker ps | perl -we 'use strict; $_ = <>; m/^(.*)NAMES/ or die; my $offset = length($1); while(<>) {substr($_, 0, $offset, q()); chomp; for(split m/\\W+/) {print qq($_:\n)} }'"))
             (dockernames (cl-remove-if-not
                           #'(lambda (dockerline) (string-match ":$" dockerline))
                           (split-string dockernames-raw "\n"))))
        (setq ad-return-value dockernames))
    ad-do-it))

;;----------------------------------------------------------------
;; Turn off major-mode selection by shebang
;; See https://stackoverflow.com/a/5328338
;; (setq interpreter-mode-alist nil)
