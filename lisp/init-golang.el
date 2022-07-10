
;(require 'company-lsp)
;(push 'company-lsp company-backends)

; (use-package lsp-ui)
; (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;(require 'flycheck)
;(add-hook 'go-mode-hook 'flycheck-mode)
;(global-flycheck-mode)

; (lsp-ui-doc-mode)
; (lsp-ui-sideline-mode)
; (lsp-ui-peek-mode)

; no supported in cli
;(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-doc-position 'at-point)
(setq lsp-ui-doc-alignment 'Window)
(setq lsp-ui-doc-include-signature t)
(setq lsp-treemacs-sync-mode t)


; (use-package lsp-ui
;   :ensure t
;   :custom-face
;   ;; (lsp-ui-doc-background ((t (:background nil))))
;   :init (setq lsp-ui-doc-enable t
;            lsp-ui-doc-include-signature t
;            lsp-ui-doc-position 'at-point
;            lsp-ui-doc-border (face-foreground 'default)
;
;            ;; lsp-enable-snippet nil
;            lsp-ui-sideline-enable nil
;            lsp-ui-peek-enable nil)
;   :bind (:map lsp-ui-mode-map
;            ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;            ([remap xref-find-references] . lsp-ui-peek-find-references)
;            ("C-c u" . lsp-ui-imenu))
;   :config
;   (setq lsp-ui-sideline-ignore-duplicate t)
;   (add-hook 'lsp-mode-hook 'lsp-ui-mode))

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

;(use-package go-guru
;  :defer t
;  :hook (go-mode . go-guru-hl-identifier-mode))
;; end gomode

(provide 'init-golang)
