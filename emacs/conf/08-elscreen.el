;; elscreen settings
;; ElScreenのプレフィックスキーを変更する（初期値はC-z）
(setq elscreen-prefix-key (kbd "C-t"))
(when (require 'elscreen nil t)
  (elscreen-start)
  ;; C-z C-zをタイプした場合にデフォルトのC-zを利用する
  (if window-system
      (define-key elscreen-map (kbd "C-t") 'iconify-or-deiconify-frame)
    (define-key elscreen-map (kbd "C-t") 'suspend-emacs)))
