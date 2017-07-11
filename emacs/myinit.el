;; Caskとpackageとpalletの連携
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; add-to-load-path 関数の定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(if (file-directory-p "~/.emacs.d/elisp")
    (add-to-load-path "elisp"))
(if (file-directory-p "~/.emacs.d/conf")
    (add-to-load-path "conf"))
(if (file-directory-p "~/.emacs.d/public_repos")
    (add-to-load-path "public_repos"))


