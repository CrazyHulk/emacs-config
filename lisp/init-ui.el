;-turn off tool-bar
(tool-bar-mode -1)

;-turn off scroll-bar
(scroll-bar-mode -1)

;;;;;set font 
(set-default-font "-*-Menlo-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1")

;;-turn off init screen;
(setq inhibit-startup-screen t)

;;-turn on cursour-type
(setq-default cursor-type 'bar)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;;hl-line-mode  (高亮当前行）
(global-hl-line-mode t)

(provide 'init-ui)
