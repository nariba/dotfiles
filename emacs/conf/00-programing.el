;; Folding source codes
;; C coding style
(add-hook 'c-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Scheme coding style
(add-hook 'scheme-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Elisp coding style
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Lisp coding style
(add-hook 'lisp-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))
;; Python coding style
(add-hook 'python-mode-hook
          '(lambda ()
      (hs-minor-mode 1)))

(define-key
  global-map
  (kbd "C-\\") 'hs-toggle-hiding)


;; diffの表示方法を変更
(defun diff-mode-setup-faces ()
  ;; 追加された行は緑で表示
  (set-face-attribute 'diff-added nil
                      :foreground "white" :background "dark green")
  ;; 削除された行は赤で表示
  (set-face-attribute 'diff-removed nil
                      :foreground "white" :background "dark red")
  ;; 文字単位での変更箇所は色を反転して強調
  (set-face-attribute 'diff-refine-change nil
                      :foreground nil :background nil
                      :weight 'bold :inverse-video t))
(add-hook 'diff-mode-hook 'diff-mode-setup-faces)

;; diffを表示したらすぐに文字単位での強調表示も行う
(defun diff-mode-refine-automatically ()
  (diff-auto-refine-mode t))
(add-hook 'diff-mode-hook 'diff-mode-refine-automatically)

;; diff関連の設定
(defun magit-setup-diff ()
  ;; diffを表示しているときに文字単位での変更箇所も強調表示する
  ;; 'allではなくtにすると現在選択中のhunkのみ強調表示する
  (setq magit-diff-refine-hunk 'all)
  ;; diff用のfaceを設定する
  (diff-mode-setup-faces)
  ;; diffの表示設定が上書きされてしまうのでハイライトを無効にする
  ;; (set-face-attribute 'magit-item-highlight nil :inherit nil)
  )
(add-hook 'magit-mode-hook 'magit-setup-diff)

;; Use spaces instead tabs
(setq-default tab-width 4 indent-tabs-mode nil)


;; GLOBAL settings (helm)
(require 'helm-gtags)
;; 保存時に自動でgtagsのアップデート
(custom-set-variables
 '(helm-gtags-suggested-key-mapping t)
 '(helm-gtags-auto-update t))

;; キーバインド
(setq helm-gtags-mode-hook
      '(lambda ()
         (define-key helm-gtags-mode-map "\C-ct" 'helm-gtags-find-tag)
         (define-key helm-gtags-mode-map "\C-cr" 'helm-gtags-find-rtag)
         (define-key helm-gtags-mode-map "\C-cs" 'helm-gtags-find-symbol)
         (define-key helm-gtags-mode-map "\C-cf" 'helm-gtags-parse-file)
         (define-key helm-gtags-mode-map "\C-c <" 'helm-gtags-previous-history)
         (define-key helm-gtags-mode-map "\C-c >" 'helm-gtags-next-history)
         (define-key helm-gtags-mode-map "\M-," 'helm-gtags-pop-stack)))

;; gtags-mode を使いたい mode の hook に追加する
(add-hook 'c-mode-common-hook
          '(lambda()
             (helm-gtags-mode 1)))
