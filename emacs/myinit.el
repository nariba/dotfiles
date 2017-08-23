;; Caskとpackageとpalletの連携
;; (package-initialize)
;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)
;; (require 'pallet)
;; (pallet-mode t)

(when load-file-name (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get"))
(require 'el-get)
(setq el-get-dir (locate-user-emacs-file "~/.emacs.d/elisp"))

;; init-loaderの起動、confディレクトリのelisp読み込み
;; (require 'init-loader)
;; (init-loader-load "~/.emacs.d/conf")
