;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;-turn off tool-bar
(tool-bar-mode -1)

;-turn off scroll-bar
(scroll-bar-mode -1)

;-turn off electric-indent-mode
;(electric-indect-mode 1)

;-turn on the line number
(setq-default cursor-type 'bar)

;-no back-file
(setq make-backup-files nil)

;grammar natively
;(require 'org)
;(setq org-src-fontify-natively t)


;-turn on recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;turn on delete selection (t == 1)
(delete-selection-mode t)


(require 'package)
(add-to-list 'package-archives'
	     ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
	     ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
	     ("melpa" . "http://melpa.milkbox.net/packages/") t)


(setq mac-option-modifier 'meta)
(Require 'cc-mode)
(load-file "/usr/share/emacs/site-lisp/xcscope.el")
(load-file "~/.emacs.d/nodejs-repl.el")
(require 'xcscope)
(require 'nodejs-repl)
(require 'xcode-mode)
(xcode-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company json-mode auto-complete ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
