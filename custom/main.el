;; ZOMG C'ETAIS TELLEMENT FUCKING EASY - RIEN NE MARCHE SANS CE TRUC
(package-initialize)

(menu-bar-mode 0)
(tool-bar-mode 0)
;; (scroll-bar-mode 0)

;; (color-theme-approximate-on)

;; (load-theme 'moe-dark t)

;; winner-mode to undo/redo windows changes
  (when (fboundp 'winner-mode)
      (winner-mode 1))

;; (set-face-attribute 'mode-line nil
;; 		    :foreground "gray0"
;; 		    :background "cyan"
;; 		    :overline "green"
;; 		    :underline "red")

;; (set-face-attribute 'mode-line-inactive nil
;; 		    :foreground "gray0"
;; 		    :background "white"
;; 		    :overline "green"
;; 		    :underline "red")

(defalias 'yes-or-no-p 'y-or-n-p)

;; Enable access to the clipboard
(setq x-select-enable-clipboard t)

;; (load-theme 'monokai t)
;; (load-theme 'zenburn t)


;;;;;;;
;; MISC
;;;;;;;

(put 'narrow-to-region 'disabled nil)

(require 'powerline)
(powerline-vim-theme)

(require 'recentf)
;; (recentf-mode 1)
(setq recentf-max-menu-items 10)
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'yasnippet)
(yas-global-mode 1)

(require 'uniquify)
;; (setq uniquify-buffer-name-style 'reverse)

(require 'key-chord)
(key-chord-mode 1)

(require 'expand-region)

(require 'multiple-cursors)

(require 'iy-go-to-char)
(add-to-list 'mc/cursor-specific-vars 'iy-go-to-char-start-pos)

;; Replace region with whatever you type
;; (delete-selection-mode 1)

;; eshell prompt color
(setq eshell-prompt-function (lambda nil
			       (concat
				(propertize (eshell/pwd) 'face `(:foreground "cyan"))
				(propertize " $" 'face `(:foreground "cyan"))
				(propertize " " 'face `(:foreground "white"))
				)))
(setq eshell-highlight-prompt nil)

;; Create a new eshell with prompt
(defun create-eshell ()
  "creates a shell with a given name"
  (interactive);; "Prompt\n eshell name:")
  (let ((eshell-name (read-string "eshell name: " nil)))
    (eshell (concat "Eshell/" eshell-name ))))

(defun create-shell ()
  "creates a shell with a given name"
  (interactive);; "Prompt\n shell name:")
  (let ((shell-name (read-string "shell name: " nil)))
    (shell (concat "Shell/" shell-name))))


;;;;;;;;;;;;;
;; Projectile
;;;;;;;;;;;;;

(projectile-global-mode t)
;; (setq projectile-enable-caching t)
;; (setq projectile-require-project-root nil)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Truncate lines in helm buffer
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun helm-buffers-list ()
;;   "Preconfigured `helm' to list buffers.
;; It is an enhanced version of `helm-for-buffers'."
;;   (interactive)
;;   (let ((helm-after-initialize-hook
;;          (cons
;;           (lambda ()
;;             (with-current-buffer (get-buffer-create helm-buffer)
;;               (setq truncate-lines t)))
;;           helm-after-initialize-hook)))
;;     (helm :sources '(helm-source-buffers-list
;;                      helm-source-ido-virtual-buffers
;;                      helm-source-buffer-not-found)
;;           :buffer "*helm buffers*" :keymap helm-buffer-map)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add prefix to Dired buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'dired-mode-hook 'ensure-buffer-name-ends-in-slash)
(defun ensure-buffer-name-ends-in-slash ()
  "change buffer name to end with slash"
  (let ((name (buffer-name)))
    (if (not (string-match "^Dir/" name))
        (rename-buffer (concat "Dir/" name) t))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Jedi - Python AutoCompletion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:setup-keys t)                      ; optional
;; (setqj edi:complete-on-dot t)                 ; optional

;;;;;;;;;;;;;;;;;;;;;;;;
;; Multi-Major-Mode Mode
;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs.d/elpa/mmm-mode-20130606.7")
;; (require 'mmm-auto)
;; (setq mmm-global-mode 'maybe)
;; (mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)

;;;;;;;;;;;;;;;;;;;;;
;; Auto-Complete Mode
;;;;;;;;;;;;;;;;;;;;;

(require 'auto-complete)
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;
;; Ace Jump Mode
;;;;;;;;;;;;;;;;

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))


;;;;;;;;;;;;
;; Emacs Nav
;;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs.d/vendor/emacs-nav")
;; (require 'nav)
;; (nav-disable-overeager-window-splitting)


;;;;;;;;;;;;;;
;; Sr-Speedbar
;;;;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs.d/vendor")
;; (require 'sr-speedbar)
;; (eval-after-load "speedbar" '(speedbar-add-supported-extension ".php"))


;;;;;;;;;;;;;;;;;;;
;; Eval and replace
;;;;;;;;;;;;;;;;;;;

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))

;;;;;;;;;;;;;;;;;;;;;;
;; Save Macro Function
;;;;;;;;;;;;;;;;;;;;;;

(defun save-macro (name)
  "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
  (interactive "SName of the macro :")  ; ask for the name of the macro
  (kmacro-name-last-macro name)         ; use this name for the macro
  (find-file user-init-file)            ; open ~/.emacs or other user init file
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Backfup Files settings (those damn annoying ~ files !)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq auto-save-file-name-transforms
      `((".*" ,"~/.saves/" t)))

;; remove those pesky lock files
(setq create-lockfiles nil)

;; (setq temporary-file-directory "~/.auto_saves/")

;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tramp (remote connection)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tramp)
(setq tramp-backup-directory-alist `(("." . "~/.saves_tramp")))
;; (add-to-list 'backup-directory-alist
;;              (cons tramp-file-name-regexp nil))

;;;;;;;;;;;
;; Ido-mode
;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs.d/elpa/ido-ubiquitous-1.6")
;; (require 'ido-ubiquitous)

(ido-mode t)
(ido-ubiquitous t)
(ido-vertical-mode t)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
(setq ido-auto-merge-work-directories-length -1)


(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ;; ido-auto-merge-work-directories-length nil
      ;; ido-create-new-buffer 'always
      ;; ido-use-filename-at-point 'guess
      ;; ido-use-virtual-buffers t
      ;; ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 30)

(setq ido-ignore-buffers
      '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

	"^\*compilation" "^\*GTAGS" "^session\.*" "^\*Compile-Log\*"
	;; "^\*"
	)
      )

(require 'flx-ido)
(ido-everywhere 1)
(flx-ido-mode 1)

;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)


;;;;;;;;;;;;
;; Smex Mode
;;;;;;;;;;;;

;; (require 'smex)
;; (smex-initialize)



;;;;;;;;;;;;;;;;;;;;;;
;; Mouse/Wheel options
;;;;;;;;;;;;;;;;;;;;;;

(defun up-and-locate()
  (interactive)
  (scroll-down 8)
  )

(defun down-and-locate()
  (interactive)
  (scroll-down -8)
  )

(defun mouse-up-and-locate()
  (interactive)
  (scroll-down 3)
  )

(defun mouse-down-and-locate()
  (interactive)
  (scroll-down -3)
  )

;;;;;;;;;;;;;;;;;
;; Hack for xterm
;;;;;;;;;;;;;;;;;

;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;2A" [S-up]))

;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;4B" [C-S-down]))

;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;4A" [C-S-up]))

;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;4D" [C-S-left]))

;; (if (equal "xterm" (tty-type))
;;     (define-key input-decode-map "\e[1;4C" [C-S-right]))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Marmelade - Package list for emacs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;; (add-to-list 'package-archives
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (package-initialize)

;;;;;;;;;;;;;;;;;;;;;;
;; Indent Whole Buffer
;;;;;;;;;;;;;;;;;;;;;;

(defun indent-whole-buffer ()
  "indent whole buffer and untabify it"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIX FOR TERMINAL SHIFT+UP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (equal "xterm" (tty-type))
    (define-key input-decode-map "\e[1;2A" [S-up]))

(defadvice terminal-init-xterm (after select-shift-up activate)
  (define-key input-decode-map "\e[1;2A" [S-up]))


;;;;;;;;;;;;;;;;;;;;;
;; Locked buffer mode
;;;;;;;;;;;;;;;;;;;;;

(define-minor-mode locked-buffer-mode
  "Make the current window always display this buffer."
  nil " locked" nil
  (set-window-dedicated-p (selected-window) locked-buffer-mode))


;; emacs doesn't actually save undo history with revert-buffer
;; see http://lists.gnu.org/archive/html/bug-gnu-emacs/2011-04/msg00151.html
;; fix that.
(defun revert-buffer-keep-history (&optional IGNORE-AUTO NOCONFIRM PRESERVE-MODES)
  (interactive)

;; tell Emacs the modtime is fine, so we can edit the buffer
(clear-visited-file-modtime)

;; insert the current contents of the file on disk
(widen)
(delete-region (point-min) (point-max))
(insert-file-contents (buffer-file-name))

;; mark the buffer as not modified
(not-modified)
(set-visited-file-modtime))


(setq revert-buffer-function 'revert-buffer-keep-history)
(add-hook 'after-revert-hook  (lambda ()   (font-lock-fontify-buffer)))
