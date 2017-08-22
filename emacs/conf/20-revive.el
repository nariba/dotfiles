;; Emacs終了時にバッファの中身を全て保存する
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe emacs" t)
(define-key ctl-x-map "F" 'resume)                        # C-x F で復元
(define-key ctl-x-map "K" 'wipe)                          # C-x K で Kill
(add-hook 'kill-emacs-hook 'save-current-configuration)   # 終了時に保存
