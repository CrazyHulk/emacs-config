(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)

(require 'company-lsp)
(push 'company-lsp company-backends)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(require 'flycheck)
(add-hook 'go-mode-hook 'flycheck-mode)
;(global-flycheck-mode)

(lsp-ui-doc-mode)
(lsp-ui-sideline-mode)
(lsp-ui-peek-mode)

; no supported in cli
;(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-alignment 'Window)
(setq lsp-ui-doc-include-signature t)
(setq lsp-treemacs-sync-mode t)

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(evil-define-key 'treemacs treemacs-mode-map (kbd "o")      #'treemacs-toggle-node)
(evil-define-key 'treemacs treemacs-mode-map (kbd "<tab>")      #'treemacs-toggle-node)
(evil-define-key 'treemacs treemacs-mode-map (kbd "TAB")      #'treemacs-toggle-node)
(evil-define-key 'treemacs treemacs-mode-map (kbd "x")      #'treemacs-collapse-parent-node)
;	("<tab>" . treemacs-TAB-actions-config)
;(evil-define-key 'lsp-ui lsp-ui-imenu-mode-map (kbd "q") #'lsp-ui-imenu--kill)
;(eval-after-load 'evil-core
;  '(evil-set-initial-state 'treemacs-mode 'emacs))
(eval-after-load 'evil-core
  '(evil-set-initial-state 'lsp-ui-imenu-mode 'emacs))


(provide 'init-golang)
