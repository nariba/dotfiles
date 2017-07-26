;; C-m にnewlineからnewline-and-indentを適用(C-jと同じ)
(global-set-key (kbd "C-m") 'newline-and-indent)

;; C-h をdelに変更 M-?をヘルプコマンドに
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "M-?") 'help)

;; 折り返しトグルコマンド
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; "C-t"でウィンドウの切り替え(C-tでの入れ替えができなくなっているのに注意)
(define-key global-map (kbd "C-t") 'other-window)

;; "C-x C-n", "C-x C-p"でウィンドウの移動を行う
(defun other-window-backward (&optional n)
  "Select Nth previous window."
  (interactive"P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key (kbd "\C-x\C-n") 'other-window)
(global-set-key (kbd "\C-x\C-p") 'other-window-backward)

;; C-x bですでに開いたバッファしか開かないように変更
(defadvice switch-to-buffer (before existing-buffer activate compile)
  "When interactive, switch to existing buffers only,
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
		      (other-buffer)
		      (null current-prefix-arg)))))

;; C-M-oにanything-c-moccur-moccur-occur-by-moccurを割り当てる
(when (require 'anything-c-moccur nil t)
  (global-set-key (kbd "C-M-o") 'anything-c-moccur-occur-by-moccur))

;; M-TABにauto-completeを割り当てる
(when (require 'auto-complete-config nil t)
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete))

;; Altキー → Meta に割り当てる
(setq mac-option-modifier 'meta)


;; switch-window用の設定
(setq switch-window-shortcut-style 'qwerty)
(when (window-system 'nil)
  (global-set-key (kbd "C-x o") 'switch-window))


;; win-switch-mode の設定
(require 'win-switch)
;;; 0.75秒間受け付けるタイマー
(setq win-switch-idle-time 0.75)
;;; 好きなキーを複数割り当てられる
;; ウィンドウ切り替え
(win-switch-set-keys '("k") 'up)
(win-switch-set-keys '("j") 'down)
(win-switch-set-keys '("h") 'left)
(win-switch-set-keys '("l") 'right)
(win-switch-set-keys '("o") 'next-window)
(win-switch-set-keys '("p") 'previous-window)
;; リサイズ
(win-switch-set-keys '("K") 'enlarge-vertically)
(win-switch-set-keys '("J") 'shrink-vertically)
(win-switch-set-keys '("H") 'shrink-horizontally)
(win-switch-set-keys '("L") 'enlarge-horizontally)
;; 分割
(win-switch-set-keys '("3") 'split-horizontally)
(win-switch-set-keys '("2") 'split-vertically)
(win-switch-set-keys '("0") 'delete-window)
;; その他
(win-switch-set-keys '(" ") 'other-frame)
(win-switch-set-keys '("u" [return]) 'exit)
(win-switch-set-keys '("\M-\C-g") 'emergency-exit)
;; C-x oを置き換える
(global-set-key (kbd "C-x o") 'win-switch-dispatch)
