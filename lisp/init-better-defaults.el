(setq ring-bell-function 'ignore)

;;auto reload file when file changes by other
(global-auto-revert-mode t)


;-turn on the line number
; (global-linum-mode t)
(display-line-numbers-mode 1)

;-no back-file
(setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

;;括号配对
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  (cond ((looking-at-p "\\s(") (funcall fn))
	 (t (save-excursion
	      (ignore-errors (backward-up-list))
	      (funcall fn)))))

;turn on delete selection (t == 1)
(delete-selection-mode t)


(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun inden-region-or-buffer()
  (interactive)
  (save-excursion)
  (if (region-active-p)
      (progn
	(indent-region (region-beginning) (region-end))
	(message "Indented selected region."))
    (progn
      (indent-buffer)
      (message "Indented buffer."))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

(provide 'init-better-defaults)
