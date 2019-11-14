(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(require 'flycheck)
(add-hook 'go-mode-hook 'flycheck-mode)
;(global-flycheck-mode)

(setq lsp-ui-doc-use-webkit t)

(lsp-ui-doc-mode)
(lsp-ui-sideline-mode)
(lsp-ui-peek-mode)
(lsp-treemacs-sync-mode)

(provide 'init-golang)
