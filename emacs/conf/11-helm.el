;; Helm
(require 'helm-config)

(helm-descbinds-mode)

;; 過去の履歴からペーストする
;; M-y にhelm-show-kill-ringを割り当てる
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)

;;; moccurを利用する──helm-c-moccur
(package-install 'helm-c-moccur)
(when (require 'helm-c-moccur nil t)
  (setq
   ;; 執筆時点でエラーが出たため定義しているが、
   ;; 将来的には不要になる可能性が高い
   helm-idle-delay 0.1
   ;; helm-c-moccur用 `helm-idle-delay'
   helm-c-moccur-helm-idle-delay 0.1
   ;; バッファの情報をハイライトする
   helm-c-moccur-higligt-info-line-flag t
   ;; 現在選択中の候補の位置をほかのwindowに表示する
   helm-c-moccur-enable-auto-look-flag t
   ;; 起動時にポイントの位置の単語を初期パターンにする
   helm-c-moccur-enable-initial-pattern t)
  ;; M-sにhelm-c-moccur-occur-by-moccurを割り当てる
  (global-set-key (kbd "M-s") 'helm-c-moccur-occur-by-moccur))
