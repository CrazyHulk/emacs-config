;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;;;;;;;;;;;;;;;;;;;;package init begin;;;;;;;;;;;;;;;;;;;;;;;
(debug-on-entry 'package-initialize)

(org-babel-load-file (expand-file-name "zhuxi.org" user-emacs-directory))


;;smex auto complete m + x
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
;(global-set-key (kbd "M-x") 'smex)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;(require 'cask "~/.emacs.d/elpa/cask-20191004.1155/cask.el")
;(cask-initialize)    ; 类似于 package-initialize

; (require 'pallet)
; (pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

;(add-to-list 'load-path
;              "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet)
;(yas-global-mode 1)

(require 'org-install)
(require 'ob-tangle)
;(org-babel-load-file (expand-file-name "zhuxi.org" user-emacs-directory))



