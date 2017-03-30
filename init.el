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

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "zhuxi.org" user-emacs-directory))



