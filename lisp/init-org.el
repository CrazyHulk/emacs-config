;grammar natively
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/.emacs.d/"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/schedule.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

(provide 'init-org)
