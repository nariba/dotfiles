(require 'multiple-cursors)
;; (defun mc/edit-lines-or-string-rectangle (s e)
;;   "C-x r tで同じ桁の場合にmc/edit-lines (C-u M-x mc/mark-all-dwoim)"
;;   (interactive "r")
;;   (if (eq (save-excursion (goto-char s) (current-column))
;;           (save-excursion (goto-char e) (current-column)))
;;       (call-interactively 'mc/edit-lines)
;;     (call-interactively 'string-rectangle)))
;; (global-set-key (kbd "C-x r t") 'mc/edit-lines-or-string-rectangle)

;; (defun mc/mark-all-dwim-or-mark-sexp (arg)
;;   "C-u C-M-SPCでmc/mark-all-dwim, C-u C-u C-M-SPCでC-u M-x mc/mark-all-dwim"
;;   (interactive "p")
;;   (cl-case arg
;;     (16 (mc/mark-all-dwim t))
;;     (4 (mc/mark-all-dwim nil))
;;     (1 (mark-sexp 1))))
;; (global-set-key (kbd "C-M-SPC") 'mc/mark-all-dwim-or-mark-sexp)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
