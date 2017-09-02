;; redo+.el
;; http://www.emacswiki.org/emacs/download/redo+.el
;; C-'でredoを行う
(when (require 'redo+ nil t)
  (global-set-key (kbd "C-'") 'redo))
