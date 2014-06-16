;; (setq helm-command-prefix-key "C-c h")
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(require-package 'helm)
(require-package 'helm-swoop)

(after 'projectile
  (require-package 'helm-projectile))

(require 'helm-config)

(require-package 'wgrep-helm)
(require 'wgrep-helm)


(helm-mode 1)

(provide 'init-helm)
