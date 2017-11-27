;; タイトルバーにファイルのフルパス表示
(setq frame-title-format "%f")

;; ツールバーの非表示
(tool-bar-mode 0)

;; menu bar の非表示
(menu-bar-mode 0)


;; Mac上で軽くするための設定
;;; これはコメントアウトor取り除く
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)

;; 高速化のためglobal-hl-line-modeの代わりに使うglobal-hl-line-timer-function
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
    (global-hl-line-highlight)))
(setq global-hl-line-timer
      (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

;; ウィンドウの透過
(if window-system
    (progn
      (add-to-list 'default-frame-alist '(alpha . (0.85 0.70)))))

(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(70))))

(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; 補完
(icomplete-mode 1)
;;(partial-completion-mode t)

;;; 行の先頭でC-kを一回押すだけで行全体を消去する
(setq kill-whole-line t)

;;; バッファの最後でnewlineで新規行を追加するのを禁止する
(setq next-line-add-newlines nil)

;;; 最終行に必ず一行挿入する
(setq require-final-newline t)

;;; 一行が 80 字以上になった時には自動改行する
(setq fill-column 80)
(setq-default auto-fill-mode t)

;;; yes or no to y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; 現在の行番号をモードラインに表示
(line-number-mode t)

;; 行番号をバッファの左に表示, 五桁分のマージンをとっておく
(setq linum-format "%5d")
(global-linum-mode 1)

;; 現在いる関数をモードラインに表示
(which-func-mode t)

;; 更新されたファイルを自動的に読み込み直す
(custom-set-variables
 '(auto-revert-check-vc-info t))
(global-auto-revert-mode t)

;; theme
(load-theme 'monokai t)

;; スクロールバーの非表示
(scroll-bar-mode 0)
