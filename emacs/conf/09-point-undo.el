;;; P137 カーソルの移動履歴 point-undo
(package-install 'point-undo)
;; point-undoの設定
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo))
