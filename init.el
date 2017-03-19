;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;;;;;;;;;;;;;;;;;;;;package init begin;;;;;;;;;;;;;;;;;;;;;;;
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t))

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

;;smex auto complete m + x
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
;(global-set-key (kbd "M-x") 'smex)


;;swiper 
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)


;;smartparens
(require 'smartparens-config)
(smartparens-global-mode t)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

;;js default js2-model
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;org mode;;;;;
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;popwin;;;;;
(require 'popwin)
(popwin-mode t)

;-turn off tool-bar
(tool-bar-mode -1)

;-turn off scroll-bar
(scroll-bar-mode -1)


;;auto reload file when file changes by other
(global-auto-revert-mode t)

;-turn off electric-indent-mode
;(electric-indect-mode 1)

;;-turn on the line number
(global-linum-mode t)

;;-turn on cursour-type
(setq-default cursor-type 'bar)

;;-turn off init screen;
(setq inhibit-startup-screen t)

;-no back-file
(setq make-backup-files nil)

;grammar natively
;(require 'org)
;(setq org-src-fontify-natively t)

;;open init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)


;-turn on recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;turn on delete selection (t == 1)
(delete-selection-mode t)


;;company model
(global-company-mode t)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;括号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;hl-line-mode  (高亮当前行）
(global-hl-line-mode t)


;;;;;;;;;;;;;;;;;;;Set sublime theme;;;;;;;;;;;;;;;;
(load-theme 'monokai t)
;;;;;set font 
(set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

;(require 'package)
;(add-to-list 'package-archives'
;	     ("elpa" . "http://tromey.com/elpa/") t)
;(add-to-list 'package-archives' 
;	     ("marmalade" . "http://marmalade-repo.org/packages/") t)
;(add-to-list 'package-archives'
;	     ("melpa" . "http://melpa.milkbox.net/packages/") t)

(setq mac-option-modifier 'meta)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
;; '(package-selected-packages (quote (company)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
