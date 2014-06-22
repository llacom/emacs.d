;;;;;;;;;;;;;;;;;;
;; Font lock speed
;;;;;;;;;;;;;;;;;;

(setq font-lock-support-mode 'jit-lock-mode)
(setq jit-lock-stealth-time
      16
      jit-lock-defer-contextually nil
      jit-lock-stealth-nice 0.5
      jit-lock-defer-time 0.05)

(setq font-lock-maximum-decoration 0)



(defun set-frame-font-size (size)
  (interactive "nSize:")
  (set-face-attribute 'default (selected-frame) :height size)
  )

;; Doesn't work ...
;; (add-hook 'after-make-frame-functions (lambda () (interactive) (set-frame-font-size 100)))


(require-package 'anzu)
(global-anzu-mode 1)

(require-package 'smart-mode-line)
(setq sml/show-client nil)
(setq sml/show-eol nil)
(setq sml/show-frame-identification nil)
(sml/setup)

(defun my-moe-light ()
  (interactive)
  (setq sml/theme 'light)
  (sml/setup)
  (setq moe-theme-mode-line-color 'cyan)
  (moe-light)
  )

(defun my-moe-dark ()
  (interactive)
  (moe-dark)
  (setq sml/theme 'dark)
  (sml/setup)
  ;; (setq moe-theme-mode-line-color 'green)
  )

;; Theme customization
(require 'moe-theme)
(my-moe-dark)
;; Available colors: blue, orange, magenta, yellow, purple, red, cyan, w/b.


;; Multicolor parenthesis
;; (require-package 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)



;; (load-theme 'wombat t)
(if (daemonp)
(add-hook 'after-make-frame-functions
          '(lambda (f)
             (with-selected-frame f
               (when (window-system f)
		 (set-cursor-color "white") ;; Set it to white
		 )))))
(set-cursor-color "#ffffff")
;; (set-face-attribute 'default nil :height 100)

;; Show indentation
(require-package 'indent-guide)
(require 'indent-guide)

;; Nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

(menu-bar-mode 0)
(tool-bar-mode 0)

(which-function-mode t)
(blink-cursor-mode -1)

;; (global-linum-mode t)
(add-hook 'project-explorer-mode-hook (lambda () (linum-mode -1)))

;; For a cleaner modeline
(require-package 'diminish)
(diminish 'visual-line-mode)
(after 'autopair (diminish 'autopair-mode))
(after 'undo-tree (diminish 'undo-tree-mode))
(after 'auto-complete (diminish 'auto-complete-mode))
(after 'projectile (diminish 'projectile-mode))
(after 'yasnippet (diminish 'yas-minor-mode))
(after 'guide-key (diminish 'guide-key-mode))
(after 'eldoc (diminish 'eldoc-mode))
(after 'smartparens (diminish 'smartparens-mode))
(after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
(after 'git-gutter+ (diminish 'git-gutter+-mode))
(after 'magit (diminish 'magit-auto-revert-mode))
;; (after 'helm (diminish 'helm-mode))
(after 'anzu (diminish 'anzu-mode))
(after 'skewer (diminish 'skewer-mode))
(after 'tern (diminish 'tern-mode))
;; (after 'company (diminish 'company-mode))




(if (fboundp 'global-prettify-symbols-mode)
    (progn
      (global-prettify-symbols-mode)
      (add-hook 'js2-mode-hook
                (lambda ()
                  (push '("function" . 955) prettify-symbols-alist)
                  (push '("return" . 8592) prettify-symbols-alist))))
  (progn
    (require-package 'pretty-symbols)
    (require 'pretty-symbols)
    (diminish 'pretty-symbols-mode)
    (add-to-list 'pretty-symbol-categories 'js)
    (add-to-list 'pretty-symbol-patterns '(955 js "\\<function\\>" (js2-mode)))
    (add-to-list 'pretty-symbol-patterns '(8592 js "\\<return\\>" (js2-mode)))
    (add-hook 'find-file-hook 'pretty-symbols-mode)))


(provide 'init-eyecandy)
