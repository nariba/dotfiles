;; Caskとpackageとpalletの連携
;; (package-initialize)
;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)
;; (require 'pallet)
;; (pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/el-get")
(require 'el-get)
(setq el-get-dir "~/.emacs.d/elisp")

;; init-loaderの起動、confディレクトリのelisp読み込み
;; (require 'init-loader)
;; (init-loader-load "~/.emacs.d/conf")
