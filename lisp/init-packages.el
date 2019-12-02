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
			 pallet
			 evil
			 evil-leader
			 window-numbering
			 which-key
			 go-mode
			 lsp-mode
			 lsp-ui
			 company-lsp
			 flycheck
			 helm-ag
			 magit
			 helm-dash
			 yasnippet
			 auto-yasnippet
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

(pallet-mode)  
;(pallet-init)    ; 在.emacs.d 中生成一个 Cask 文件, 写入源与现有包
;(pallet-install) ; 将 elpa 中的 package 拷贝到.Cask/<you version>/elpa 目录中

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

(provide 'init-packages)
