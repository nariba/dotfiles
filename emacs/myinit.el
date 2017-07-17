;; proxy の設定
;; ロードパスの追加
(setq load-path (append
                 '("~/.emacs.d/private-conf")
                 load-path))

;; proxy設定
;; private-conf/myproxy.elがあるときだけプロキシ設定をロード
;; 第2引数のtをつけると、ファイルが存在しなくてもエラーにならない
(load "myproxy" t)


;; Caskとpackageとpalletの連携
(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; init-loaderの起動、confディレクトリのelisp読み込み
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")
