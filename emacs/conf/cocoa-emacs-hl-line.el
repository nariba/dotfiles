;; カーソルの色を変更
(when (window-system 'nil)
  (if window-system
      (progn
	(if (fboundp 'mac-input-source)
	    (progn
	      (defun my-mac-selected-keyboard-input-source-change-function-cursor ()
		(let ((mac-input-source (mac-input-source)))
		  (set-cursor-color
		   (if (or (string-match "com.apple.inputmethod.Kotoeri.Roman" mac-input-source)
			   (string-match "com.apple.keylayout.US" mac-input-source))
		       "white" "tomato1"))))
	      ;; hook for cursor
	      (add-hook 'mac-selected-keyboard-input-source-change-hook
			'my-mac-selected-keyboard-input-source-change-function)
	      ;; timer for cursor
	      (setq-default global-cursor-color-timer
			    (run-with-idle-timer
			     0.03
			     t
			     'my-mac-selected-keyboard-input-source-change-function-cursor)))))))

;; カーソルのある行のハイライト色を変更
(when (window-system 'nil)
  (if window-system
      (progn
	(if (fboundp 'mac-input-source)
	    (progn
	      (defun my-mac-selected-keyboard-input-source-change-function_highlight ()
		(let ((mac-input-source (mac-input-source)))
		  (set-face-background hl-line-face
				       (if (or (string-match "com.apple.inputmethod.Kotoeri.Roman" mac-input-source)
					       (string-match "com.apple.keylayout.US" mac-input-source))
					   "gray25" "tomato4"))))
	      ;; hook for cursor
	      (add-hook 'mac-selected-keyboard-input-source-change-hook
			'my-mac-selected-keyboard-input-source-change-function_highlight)
	      ;; timer for cursor
	      (setq-default global-cursor-color-timer
			    (run-with-idle-timer
			     0.03
			     t
			     'my-mac-selected-keyboard-input-source-change-function_highlight)))))))
