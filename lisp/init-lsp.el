(use-package ccls
  :ensure t
  :config
  (setq ccls-executable (expand-file-name "~/.emacs.d/ccls"))
  )

;; (use-package eglot
  ;; :config
  ;; (add-hook 'prog-mode-hook 'eglot-ensure))

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-enable-snippet t)
  (lsp-keep-workspace-alive t)
  (lsp-enable-xref t)
  (lsp-enable-imenu t)
  (lsp-enable-completion-at-point nil)

  :config  
  (add-hook 'go-mode-hook #'lsp)
  ; (add-hook 'python-mode-hook #'lsp)
  ; (add-hook 'c++-mode-hook #'lsp)
  ; (add-hook 'c-mode-hook #'lsp)
  ; (add-hook 'rust-mode-hook #'lsp)
  ; (add-hook 'json-mode-hook #'lsp)
  ; (add-hook 'yaml-mode-hook #'lsp)
  ; (add-hook 'dockerfile-mode-hook #'lsp)
  ; (add-hook 'shell-mode-hook #'lsp)

  ; (lsp-register-client
  ;  (make-lsp-client :new-connection (lsp-stdio-connection "pyls")
  ;                   :major-modes '(python-mode)
  ;                   :server-id 'pyls))
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.500) ;; default is 0.2
  ; (require 'lsp-clients) 
  :commands lsp)

;; Pre-install:
;; go get -u golang.org/x/tools/cmd/gopls
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection "gopls")
                  :major-modes '(go-mode)
                  :priority 0
                  :initialization-options 'lsp-clients-go--make-init-options
                  :server-id 'gopls
                  :library-folders-fn (lambda (_workspace)
                                        lsp-clients-go-library-directories)))


(use-package lsp-ui
  :ensure t
  :custom-face
  ; (lsp-ui-doc-background ((t (:background nil))))
  :init (setq lsp-ui-doc-enable t
              lsp-ui-doc-include-signature t               

              lsp-enable-snippet nil
              lsp-ui-sideline-enable nil
              lsp-ui-peek-enable nil

              lsp-ui-doc-position              'at-point
              lsp-ui-doc-header                nil
              lsp-ui-doc-border                "white"
              lsp-ui-doc-include-signature     t
              lsp-ui-sideline-update-mode      'point
              lsp-ui-sideline-delay            1
              lsp-ui-sideline-ignore-duplicate t
              lsp-ui-peek-always-show          t
              lsp-ui-flycheck-enable           nil
              )
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(setq lsp-prefer-capf t)

(provide 'init-lsp)
