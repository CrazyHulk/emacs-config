; no supported in cli
;(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-alignment 'Window)
(setq lsp-ui-doc-include-signature t)
(setq lsp-treemacs-sync-mode t)



(require 'lsp-mode)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'yas-minor-mode)
; (add-hook 'after-init-hook 'global-company-mode)

(lsp-register-custom-settings
 '(("gopls-remote.usePlaceholders" lsp-go-use-placeholders t)
   ("gopls-remote.hoverKind" lsp-go-hover-kind)
   ("gopls-remote.buildFlags" lsp-go-build-flags)
   ("gopls-remote.env" lsp-go-env)
   ("gopls-remote.linkTarget" lsp-go-link-target)
   ("gopls-remote.codelenses" lsp-go-codelenses)
   ("gopls-remote.linksInHover" lsp-go-links-in-hover t)
   ("gopls-remote.gofumpt" lsp-go-use-gofumpt t)
   ("gopls-remote.local" lsp-go-goimports-local)
   ("gopls-remote.directoryFilters" lsp-go-directory-filters)
   ("gopls-remote.analyses" lsp-go-analyses)
   ("gopls-remote.importShortcut" lsp-go-import-shortcut)
   ("gopls-remote.symbolMatcher" lsp-go-symbol-matcher)
   ("gopls-remote.symbolStyle" lsp-go-symbol-style)))

(lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection
                                     (lambda () (cons "gopls" lsp-go-gopls-server-args)))
                    :major-modes '(go-mode go-dot-mod-mode)
                    :language-id "go"
                    :priority 0
                    :server-id 'gopls-remote
                    :completion-in-comments? t
                    :library-folders-fn #'lsp-go--library-default-directories
                    :after-open-fn (lambda ()
                                     ;; https://github.com/golang/tools/commit/b2d8b0336
                                     (setq-local lsp-completion-filter-on-incomplete nil))
                    :remote? t
                    ))

;;(use-package company-go
;;  :init
;;  (progn
;;    (setq company-go-show-annotation t)
;;    (setq company-tooltip-limit 20)                      ; bigger popup window
;;    (add-hook 'go-mode-hook 
;;              (lambda ()
;;                (set (make-local-variable 'company-backends) '(company-go))
;;                (company-mode)))
;;    )
;;  )
;;
;;(use-package go-eldoc
;;  :config
;;  (progn
;;    (add-hook 'go-mode-hook 'go-eldoc-setup)
;;    ))

;(use-package go-guru
;  :defer t
;  :hook (go-mode . go-guru-hl-identifier-mode))
;; end gomode

(provide 'init-golang)
