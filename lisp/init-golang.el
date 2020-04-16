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
  ;; (lsp-ui-doc-background ((t (:background ni))))
  :init (setq lsp-ui-doc-enable t
           lsp-ui-doc-include-signature t
           lsp-ui-doc-position 'at-point
           lsp-ui-doc-border (face-foreground 'default)

           ;; lsp-enable-snippet nil
           lsp-ui-sideline-enable nil
           lsp-ui-peek-enable nil)
  :bind (:map lsp-ui-mode-map
           ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
           ([remap xref-find-references] . lsp-ui-peek-find-references)
           ("C-c u" . lsp-ui-imenu))
  :config
  (setq lsp-ui-sideline-ignore-duplicate t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

;; go-mode
(use-package go-mode
  :config
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)
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

(use-package go-guru
  :defer t
  :hook (go-mode . go-guru-hl-identifier-mode))
;; end gomode

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


(add-hook 'before-save-hook 'gofmt-before-save)
(provide 'init-golang)
