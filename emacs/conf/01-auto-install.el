;; auto-installの設定
(when (require 'auto-install nil t)
	       (setq auto-install-directory "~/.emacs.d/elisp/")
	       (auto-install-update-emacswiki-package-name t)
	       (auto-install-compatibility-setup))
