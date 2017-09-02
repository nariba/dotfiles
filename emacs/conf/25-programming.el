;; ホックを使った設定
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
  )
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)


(add-to-list 'load-path
	     "~/path-to-yasnippet")
(require 'yasnippet)
(yas-global-mode 1)


(require 'pos-tip)
;;(pos-tip-w32-max-width-height)   ; Maximize frame temporarily
;;(pos-tip-w32-max-width-height t) ; Keep frame maximized


(use-package auto-complete-c-headers
  :init
  (add-hook 'c++-mode-hook (lambda ()
            '(setq ac-sources (append ac-sources '(ac-source-c-headers)))))
  (add-hook 'c-mode-hook (lambda ()
            '(setq ac-sources (append ac-sources '(ac-source-c-headers))))))

(require 'ac-clang)

;;(setq w32-pipe-read-delay 0)          ;; <- Windows Only

(when (ac-clang-initialize)
  (add-hook 'c-mode-common-hook '(lambda ()
				   (setq ac-clang-cflags CFLAGS)
				   (ac-clang-activate-after-modify))))


;; auto-complete-clang 設定
(require 'auto-complete-config)
(require 'ac-clang)
;;(require 'auto-complete-clang)
;; (ac-config-default)

;;補完キー指定
(ac-set-trigger-key "TAB")
;;ヘルプ画面が出るまでの時間（秒）
(setq ac-quick-help-delay 0.8)

(defun my-ac-cc-mode-setup ()
  ;;tなら自動で補完画面がでる．nilなら補完キーによって出る
  (setq ac-auto-start t)
  (setq ac-clang-prefix-header "~/site-lisp/stdafx.pch")
  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-sources (append '(ac-source-clang-async
			     ac-source-yasnippet
			     ac-source-gtags)
			   ac-sources)))

(defun my-ac-config ()
  (global-set-key "\M-/" 'ac-start)
  ;; C-n/C-p で候補を選択
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)

  (setq-default ac-sources '(ac-source-abbrev
			     ac-source-dictionary
			     ac-source-words-in-same-mode-buffers))
  (add-hook 'c++-mode-hook 'ac-cc-mode-setup)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)

;; gtags(GNU GLOBAL)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GNU GLOBAL(gtags)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook
      '(lambda ()
         (local-set-key "\M-t" 'gtags-find-tag)
         (local-set-key "\M-r" 'gtags-find-rtag)
         (local-set-key "\M-s" 'gtags-find-symbol)
         (local-set-key "\C-c t" 'gtags-pop-stack)
         ))
