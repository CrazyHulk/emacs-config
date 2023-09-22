;-turn off tool-bar
(tool-bar-mode -1)

;-turn off scroll-bar
; (scroll-bar-mode -1)
(if (display-graphic-p)
    (progn
      (tool-bar-mode -1)
      (scroll-bar-mode -1)))
(menu-bar-mode -1)

(setq redisplay-dont-pause t
  scroll-margin 1
  scroll-step 1
  scroll-conservatively 10000
  scroll-preserve-screen-position 1)

;;;;;set font 
(set-frame-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")
; (when (memq window-system '(mac ns))
  ; (set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))
;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font 
(defun s-font()
  (interactive)
  ;; font config for org table showing.
  ; (set-default-font "monospace-11")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "WenQuanYi Micro Hei")))
  ;; tune rescale so that Chinese character width = 2 * English character width
  (setq face-font-rescale-alist '(("monospace" . 1.0) ("WenQuanYi" . 1.23))))

(add-to-list 'after-make-frame-functions
             (lambda (new-frame)
               (select-frame new-frame)
               (if window-system
                   (s-font))))
(if window-system
    (s-font))

;;-turn off init screen;
(setq inhibit-startup-screen t)

;;-turn on cursour-type
(setq-default cursor-type 'bar)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;hl-line-mode  (高亮当前行）
(global-hl-line-mode t)

(load-theme 'monokai t)
;(load-theme 'paper t)

(setq ring-bell-function 'ignore)
(setq-default scroll-up-aggressively 0.01 scroll-down-aggressively 0.01)
(provide 'init-ui)
