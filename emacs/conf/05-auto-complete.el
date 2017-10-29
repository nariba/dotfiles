;; auto-completeの設定
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
  (ac-config-default))

(when (require 'auto-complete-config nil t)
  ;; auto-completeまでの時間
  (setq ac-delay 0.1)
  ;; メニューが表示されるまで
  (setq ac-auto-show-menu 0.2)
  ;; 補完メニューをC-p C-nで操作できるようにする(通常はTABで上や下に移動する)
  (setq ac-use-menu-map t)
  ;; あいまい検索
  (setq ac-use-fuzzy t)
  (setq ac-use-menu-map t)
  (setq ac-ignore-case nil))
