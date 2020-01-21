(setq mac-command-modifier 'super)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;org mode;;;;;
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key (kbd "C-c g f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "C-c s") 'org-capture)

(global-set-key (kbd "M-x") 'helm-M-x)

(global-set-key (kbd "s-<f12>") 'counsel-git)
(global-set-key (kbd "s-f") 'helm-do-ag-project-root)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'find-file
  "fr" 'recentf-open-files

  "gf" 'counsel-git

  "bb" 'switch-to-buffer
  "bk" 'kill-buffer

  "t"  'lsp-ui-imenu

  "r"  'helm-do-ag-project-root

  "e"  'treemacs

  "ps" 'helm-do-ag-project-root
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
;  ":"  'counsel-M-x
  ":"  'helm-M-x
  "wM" 'delete-other-windows)

(provide 'init-keybindings)
