;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when load-file-name (setq user-emacs-directory (file-name-directory load-file-name)))

(load "~/.emacs.d/mypackage.el")

;; init-loaderの起動、confディレクトリのelisp読み込み
(require 'init-loader)
(init-loader-load "~/.emacs.d/conf")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-check-vc-info t)
 '(git-gutter:added-sign ">")
 '(git-gutter:deleted-sign "x")
 '(git-gutter:modified-sign "*")
 '(helm-gtags-auto-update t)
 '(helm-gtags-suggested-key-mapping t)
 '(nil nil t)
 '(package-selected-packages
   (quote
    (howm package-utils switch-window win-switch init-loader popup async bind-key cask dash diminish epl f flycheck git-commit magit-popup package-build pkg-info s shut-up with-editor auto-complete yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell drag-stuff)))
 '(safe-local-variable-values
   (quote
    ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook
            (quote write-contents-functions)
            (lambda nil
              (delete-trailing-whitespace)
              nil))
           (require
            (quote whitespace))
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face tabs trailing lines-tail)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
