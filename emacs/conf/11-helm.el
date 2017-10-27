;; Helm
(require 'helm-config)

(helm-descbinds-mode)

;; 過去の履歴からペーストする
;; M-y にhelm-show-kill-ringを割り当てる
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
