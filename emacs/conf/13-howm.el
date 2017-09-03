;; howmの設定

;; howmメモの保存の場所
(setq howm-directory (concat user-emacs-directory "howm"))
;; howm-menuの言語を日本語に
(setq howm-menu-lang 'ja)
;; howmメモを1日1ファイルにする
(setq howm-file-name-format "%Y/%m/%Y-%m-%d.howm")
;; howm-mode の読み込み
(when (require 'howm-mode nil t)
  ;; C-c ,,でhowm-menuの起動
  (define-key global-map (kbd "C-c ,,") 'howm-menu))

;; howmメモを保存と同時に閉じる
(defun howm-save-buffer-and-kill ()
  "howmメモを保存とド王子に閉じます"
  (interactive)
  (when (and (buffer-file-name)
	     (string-match "//.howm" (buffer-file-name)))
    (save-buffer)
    (kill-buffer nil)))

;; C-c C-c でメモの保存と同時にバッファを閉じる
(define-key howm-mode-map (kbd "C-c C-c") 'howm-save-buffer-and-kill)
