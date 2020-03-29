;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Author: Zach
;; Version: 0.2
(require 'package)

(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(elpy
    flycheck
    py-autopep8
    calmer-forest-theme
    challenger-deep-theme
    cyberpunk-theme
    dakrone-theme
    dracula-theme
    espresso-theme
    exotica-theme
    latex-preview-pane
    flycheck
    org
    pkg-info
    auctex-lua
    writeroom-mode
    auto-complete
    cheatsheet
    darkroom
    auctex-latexmk
    abyss-theme
    ebib
    tex-smart-umlauts
    textmate
    typit
    typo
    underwater-theme
    org2blog
    ox-hugo
    auto-dictionary
    cdlatex
    latex-extra
    latex-math-preview
    latex-unicode-math-mode
    markdown-mode)
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; Global prettification
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(load-theme 'abyss t)
(global-linum-mode t)
(set-default-font "Courier Prime Code-12" nil t)
;;  Courier Prime Code
;;  Inconsolata
;; ---------------------


;; Development setup
;; Python
(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; LaTeX
(setq-default TeX-engine 'default) ;;the default engine
;; (setq-default TeX-engine 'xetex) ;;change the default engine to XeTeX
;; (setq-default TeX-engine 'xelatex) ;;change the default engine to XeTeX
;; (setq-default TeX-engine 'pdflatex) ;;change the default engine to XeTeX
(setq-default TeX-PDF-mode t)
(latex-preview-pane-enable)
;; (add-hook 'writeroom-mode-hook 'zenburn-emacs-nw)



;; Org-Mode tweaks
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
        (sequence "WAITING(w)" "CANCELED(c)")
	(sequence "ACTIVE(a)")))
(setq org-todo-keyword-faces
      '(("ACTIVE" . (:foreground "yellow")) ("WAITING" . (:foreground "cyan")) ("CANCELED" . (:foreground "purple" :weight bold))))
(setq org-default-notes-file (concat "Dropbox/GTD/inbox.org"))


;; Bind Org Capture to C-c c
(global-set-key "\C-cc" 'org-capture)
