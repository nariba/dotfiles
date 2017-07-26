;; タイトルバーにファイルのフルパス表示
(setq frame-title-format "%f")

;; ツールバーの非表示
(tool-bar-mode 0)

;; スクロールバーの非表示
(scroll-bar-mode 0)

;; menu bar の非表示
(menu-bar-mode 0)

;; カーソルの色を変更
(when (window-system 'nil)
  (if window-system
      (progn
	(if (fboundp 'mac-input-source)
	    (progn
	      (defun my-mac-selected-keyboard-input-source-change-function-cursor ()
		(let ((mac-input-source (mac-input-source)))
		  (set-cursor-color
		   (if (or (string-match "com.apple.inputmethod.Kotoeri.Roman" mac-input-source)
			   (string-match "com.apple.keylayout.US" mac-input-source))
		       "white" "tomato1"))))
	      ;; hook for cursor
	      (add-hook 'mac-selected-keyboard-input-source-change-hook
			'my-mac-selected-keyboard-input-source-change-function)
	      ;; timer for cursor
	      (setq-default global-cursor-color-timer
			    (run-with-idle-timer
			     0.03
			     t
			     'my-mac-selected-keyboard-input-source-change-function-cursor)))))))

;; カーソルのある行のハイライト色を変更
(when (window-system 'nil)
  (if window-system
      (progn
	(if (fboundp 'mac-input-source)
	    (progn
	      (defun my-mac-selected-keyboard-input-source-change-function_highlight ()
		(let ((mac-input-source (mac-input-source)))
		  (set-face-background hl-line-face
				       (if (or (string-match "com.apple.inputmethod.Kotoeri.Roman" mac-input-source)
					       (string-match "com.apple.keylayout.US" mac-input-source))
					   "gray25" "tomato4"))))
	      ;; hook for cursor
	      (add-hook 'mac-selected-keyboard-input-source-change-hook
			'my-mac-selected-keyboard-input-source-change-function_highlight)
	      ;; timer for cursor
	      (setq-default global-cursor-color-timer
			    (run-with-idle-timer
			     0.03
			     t
			     'my-mac-selected-keyboard-input-source-change-function_highlight)))))))

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


(line-number-mode t)
(which-func-mode 1)
