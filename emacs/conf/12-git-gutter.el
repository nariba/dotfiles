;;; P204 差分の表示──git-gutter
(require 'git-gutter)
(when (require 'git-gutter nil t)
  (global-git-gutter-mode t)
  ;; linum-modeを利用している場合は次の設定も追加
  (git-gutter:linum-setup)
  )

(custom-set-variables
 '(git-gutter:modified-sign "*")
 '(git-gutter:added-sign ">")
 '(git-gutter:deleted-sign "x"))

(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
