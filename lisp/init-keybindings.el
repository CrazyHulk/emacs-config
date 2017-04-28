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

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(provide 'init-keybindings)
