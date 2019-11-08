;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;;;;;;;;;;;;;;;;;;;;;package init begin;;;;;;;;;;;;;;;;;;;;;;;




;;smex auto complete m + x
;;(require 'smex) ; Not needed if you use package.el
;;(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
;(global-set-key (kbd "M-x") 'smex)

(package-initialize)

(require 'cask "~/.emacs.d/elpa/cask-20191004.1155/cask.el")
(cask-initialize)    ; 类似于 package-initialize
(require 'pallet)
(pallet-mode t)      ; 激活 pallet, 在安装包时将 Cask 文件写入相应信息

;(add-to-list 'load-path
;              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;(require 'evil-leader)
;(global-evil-leader-mode)
;(evil-leader/set-key
;  "ff" 'find-file
;  "bb" 'switch-to-buffer
;  "0"  'select-window-0
;  "1"  'select-window-1
;  "2"  'select-window-2
;  "3"  'select-window-3
;  "w/" 'split-window-right
;  "w-" 'split-window-below
;  ":"  'counsel-M-x
;  "wM" 'delete-other-windows
;  )

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "zhuxi.org" user-emacs-directory))



