(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
  (add-to-list 'package-archives '("melpaen" . "https://melpa.org/packages/")))

(require 'cl)
;;add whatever packages you want here
(defvar zhuxi/packages '(
			 company
			 monokai-theme
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
			 go-mode
			 pallet
			 evil
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
(provide 'init-packages)

(pallet-mode)  
;(pallet-init)    ; 在.emacs.d 中生成一个 Cask 文件, 写入源与现有包
;(pallet-install) ; 将 elpa 中的 package 拷贝到.Cask/<you version>/elpa 目录中
