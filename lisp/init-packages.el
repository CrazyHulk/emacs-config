(when (>= emacs-major-version 24)
  (require 'package)

  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
  (add-to-list 'package-archives '("melpaen" . "https://melpa.org/packages/")))
(setq package-archives
      '(("org" . "https://orgmode.org/elpa/")
    ("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("gnu" . "https://elpa.gnu.org/packages/")))

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'cl)
;;add whatever packages you want here
(defvar zhuxi/packages '(
			 use-package
			 company
			 monokai-theme
			 paper-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin
			 reveal-in-osx-finder
			 expand-region
			 iedit
			 org-pomodoro
			 evil
			 evil-leader
			 window-numbering
			 which-key
			 go-mode
			 lsp-mode
			 lsp-ui
			 lsp-treemacs
			 treemacs-evil
;			 company-lsp
			 flycheck
			 helm
			 helm-ag
			 magit
			 helm-dash
			 yasnippet
			 auto-yasnippet
			 protobuf-mode
			 rainbow-mode
			 rainbow-delimiters
			 ;ivy-posframe
			 ) "Default packages")

(setq package-selected-packages zhuxi/packages)


(defun zhuxi/packages-installed-p ()
  (loop for pkg in zhuxi/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (zhuxi/packages-installed-p)
  (message "%s" "Refreshing packages database...")
  (package-refresh-contents)
  (dolist (pkg zhuxi/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))
;;;;;;;;;;;;;;;;;;;;;;;package init complete;;;;;;;;;;;;;;;;;;
;;hungry delete
(require 'hungry-delete)
(global-hungry-delete-mode t)

;;swiper 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;;js default js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-jsx-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;;;;;;;popwin;;;;;
(require 'popwin)
(popwin-mode t)

;;company model
(global-company-mode t)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 1)
(setq company-dabbrev-ignore-case t)
(add-to-list 'company-auto-complete-chars (char-syntax ?:))

;;smartparens
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;;expand-region
(global-set-key (kbd "C-=") 'er/expand-region)
;;;;;;;;;;;;;;;;;;;Set sublime theme;;;;;;;;;;;;;;;;
;; (setq
;;  monokai-highlight-alt "#57D3EF")
;;  (setq monokai-user-variable-pitch t)
;; (load-theme 'monokai t)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)


; vim mode
(evil-mode 1)

(window-numbering-mode)

;(require 'powerline)
;(powerline-default-theme)

(setq which-key-show-early-on-C-h t)
(setq which-key-idle-delay 0.01)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)
;(setq which-key-side-window-location 'right)

(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;(require 'ivy-posframe)
;; display at `ivy-posframe-style'
;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-point)))
;(setq ivy-posframe-parameters
;      '((left-fringe . 8)
;        (right-fringe . 8)))
;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;(ivy-posframe-mode 1)

(use-package rainbow-mode
  :config
  (progn
    (defun @-enable-rainbow ()
      (rainbow-mode t))
    (add-hook 'prog-mode-hook '@-enable-rainbow)
))
(use-package rainbow-delimiters
  :config
  (progn
    (defun @-enable-rainbow-delimiters ()
      (rainbow-delimiters-mode t))
    (add-hook 'prog-mode-hook '@-enable-rainbow-delimiters)))
(if (display-graphic-p)
    (progn
      (set-face-attribute 'default nil
                          :family "LigaSauceCodeProMedium Nerd Font"
                          :height 140
                          :weight 'Medium)
;      (load-theme 'doom-dracula)
      ))


(provide 'init-packages)
