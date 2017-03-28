(setq ring-bell-function 'ignore)

;;auto reload file when file changes by other
(global-auto-revert-mode t)


;-turn on the line number
(global-linum-mode t)

;-no back-file
(setq make-backup-files nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;括号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;turn on delete selection (t == 1)
(delete-selection-mode t)


(provide 'init-better-defaults)
