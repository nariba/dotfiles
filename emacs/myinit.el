;; Caskとpackageとpalletの連携
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; init-loaderの起動、confディレクトリのelisp読み込み
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
