;; Add Package Repository
;; Add the MELPA
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Add the MELPA-stable
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; Add the Marmalade
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Add the Org
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; Refresh package contents
(package-refresh-contents)

;; Packages
(defvar my/favorite-packages
  '(
    ace-jump-buffer
    async
    auto-complete
    bind-key
    buffer-move
    dash
    dockerfile-mode
    diminish
    drag-stuff
    elscreen
    epl
    exec-path-from-shell
    expand-region
    f
    flycheck
    flycheck-pos-tip
    flycheck-cask
    flycheck-rust
    git-commit
    git-gutter
    helm
    helm-c-moccur
    helm-descbinds
    helm-gtags
    howm
    htmlize
    idle-highlight-mode
    init-loader
    magit
    magit-popup
    monokai-theme
    multiple-cursors
    nyan-mode
    package-build
    package-utils
    pkg-info
    popup
    popwin
    pos-tip
    prodigy
    projectile
    quickrun
    rust-mode
    s
    shut-up
    smartparens
    smex
    switch-window
    undohist
    undo-tree
    use-package
    web-mode
    win-switch
    with-editor
    yascroll
    yasnippet
;;    anything
;;    point-undo
;;    redo+
    ))

;; Install Packages if not installed
(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-install package)))
