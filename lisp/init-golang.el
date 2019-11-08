(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(provide 'init-golang)
