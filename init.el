;; (add-to-list 'load-path "~/.emacs.d/vendor/org-mode-zip/lisp")
;; (add-to-list 'load-path "~/.emacs.d/vendor/org-mode/lisp")

(if (file-newer-than-file-p "~/.emacs.d/config.org" "~/.emacs.d/config.el")
    (shell-command-to-string "emacs -q --script ~/.emacs.d/tangle_config.el"))

(require 'org)
(load-file (expand-file-name "~/.emacs.d/config.el"))
;; (org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))







;; (defgroup dotemacs nil
;;   "Custom configuration for dotemacs."
;;   :group 'local)

;; (defcustom dotemacs-cache-directory (concat user-emacs-directory ".cache/")
;;   "The storage location for various persistent files."
;;   :group 'dotemacs)

;; (add-to-list 'load-path (concat user-emacs-directory "config"))

;; (setq custom-file (concat user-emacs-directory "custom.el"))
;; (when (file-exists-p custom-file)
;;   (load custom-file))

;; (defcustom dotemacs-modules
;;   '(init-packages
;;     init-util
;;     init-core

;;     init-bindings
;;     init-eyecandy

;;     ;; init-autocomplete
;;     init-company

;;     init-yasnippet
;;     init-org
;;     init-helm
;;     init-smartparens
;;     ;; init-discover
;;     ;; init-evil
;;     init-workspace2

;;     init-macro

;;     init-c
;;     init-coffeescript
;;     init-jade
;;     init-js
;;     init-livescript
;;     init-lua
;;     init-php
;;     init-python
;;     init-web

;;     init-overrides
;;     )
;;   "Set of modules enabled in dotemacs."
;;   :group 'dotemacs)

;; (dolist (module dotemacs-modules)
;;   (require module))
