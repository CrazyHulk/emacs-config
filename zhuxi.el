; (package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;open init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)
(require 'init-treemacs)
(require 'init-lsp)

(require 'init-golang)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)  ;; 如果该文件不存在
  (write-region "" nil custom-file)) ;; 写入一个空内容，相当于 touch 一下它
(load-file custom-file)

;-turn off electric-indent-mode
;(electric-indect-mode 1)


(setq mac-option-modifier 'meta)
