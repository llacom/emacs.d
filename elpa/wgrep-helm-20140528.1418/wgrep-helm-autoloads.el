;;; wgrep-helm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (wgrep-helm-setup) "wgrep-helm" "wgrep-helm.el"
;;;;;;  (21404 6222 857631 464000))
;;; Generated autoloads from wgrep-helm.el

(autoload 'wgrep-helm-setup "wgrep-helm" "\


\(fn)" nil nil)
(add-hook 'helm-grep-mode-hook 'wgrep-helm-setup)
(add-hook 'helm-moccur-mode-hook 'wgrep-helm-setup)

;;;***

;;;### (autoloads nil nil ("wgrep-helm-pkg.el") (21404 6222 878962
;;;;;;  423000))

;;;***

(provide 'wgrep-helm-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; wgrep-helm-autoloads.el ends here
