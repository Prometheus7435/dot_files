(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(setq user-full-name "Zachary Bombay"
      user-mail-address "zacharybombay@gmail.com"
      calendar-latitude 39.034655
      calendar-longitude -77.380606
      calendar-location-name "Sterling, VA")

(defun zb/rename-file (new-name)
  (interactive "FNew name: ")
  (let ((filename (buffer-file-name)))
    (if filename
	(progn
	  (when (buffer-modified-p)
	    (save-buffer))
	  (rename-file filename new-name t)
	  (kill-buffer (current-buffer))
	  (find-file new-name)
	  (message "Renamed '%s' -> '%s'" filename new-name))
(message "Buffer '%s' isn't backed by a file!" (buffer-name)))))

(defun zb/generate-scratch-buffer ()
  "Create and switch to a temporary scratch buffer with a random
 name."
  (interactive)
  (switch-to-buffer (make-temp-name "scratch-")))

(defun zb/find-file-as-sudo ()
  (interactive)
  (let ((file-name (buffer-file-name)))
    (when file-name
(find-alternate-file (concat "/sudo::" file-name)))))

(defun zb/region-or-word ()
  (if mark-active
(buffer-substring-no-properties (region-beginning)
				(region-end))
    (thing-at-point 'word)))

(defun zb/append-to-path (path)
  "Add a path both to the $PATH variable and to Emacs' exec-path."
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))

(defun zb/insert-password ()
  (interactive)
  (shell-command "pwgen 30 -1" t))

(defun zb/notify-send (title message)
  "Display a desktop notification by shelling out to `notify-send'."
  (call-process-shell-command
   (format "notify-send -t 2000 \"%s\" \"%s\"" title message)))

(use-package treemacs)
;;  (treemacs-enable)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)
(global-linum-mode t)
(column-number-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq frame-title-format "%b")
;; (setq frame-title-format '((:eval (projectile-project-name))))

(global-prettify-symbols-mode t)

(use-package abyss-theme)
;; (load-theme 'abyss t)

(use-package moody
  :config
  (setq x-underline-at-descent-line t
	moody-mode-line-height 30))

(setq zb/default-font "Source Code Pro")
(setq zb/default-font-size 12)
(setq zb/current-font-size zb/default-font-size)

(setq zb/font-change-increment 1.1)

(defun zb/font-code ()
  "Return a string representing the current font (like \"Source Code Pro-14\")."
  (concat zb/default-font "-" (number-to-string zb/current-font-size)))

(defun zb/set-font-size ()
  "Set the font to `zb/default-font' at `zb/current-font-size'.
Set that for the current frame, and also make it the default for
other, future frames."
  (let ((font-code (zb/font-code)))
    (if (assoc 'font default-frame-alist)
	(setcdr (assoc 'font default-frame-alist) font-code)
(add-to-list 'default-frame-alist (cons 'font font-code)))
    (set-frame-font font-code)))

(defun zb/reset-font-size ()
  "Change font size back to `zb/default-font-size'."
  (interactive)
  (setq zb/current-font-size zb/default-font-size)
  (zb/set-font-size))

(defun zb/increase-font-size ()
  "Increase current font size by a factor of `zb/font-change-increment'."
  (interactive)
  (setq zb/current-font-size
	(ceiling (* zb/current-font-size zb/font-change-increment)))
  (zb/set-font-size))

(defun zb/decrease-font-size ()
  "Decrease current font size by a factor of `zb/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq zb/current-font-size
	(max 1
	(floor (/ zb/current-font-size zb/font-change-increment))))
  (zb/set-font-size))

(define-key global-map (kbd "C-)") 'zb/reset-font-size)
(define-key global-map (kbd "C-+") 'zb/increase-font-size)
(define-key global-map (kbd "C--") 'zb/decrease-font-size)
(zb/reset-font-size)

(global-hl-line-mode)

(use-package diff-hl
  :config
  (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

(use-package company)
(add-hook 'after-init-hook 'global-company-mode)

(global-set-key (kbd "M-/") 'company-complete-common)

(use-package let-alist)
(use-package flycheck
  :hook ruby-mode)

(use-package magit
  :bind
  ("C-x g" . magit-status)

  :config
  (use-package with-editor)

  (setq magit-push-always-verify nil
	git-commit-summary-max-length 50))

(use-package git-timemachine)

(use-package projectile
  :bind
  ("C-c v" . projectile-ag)

  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (setq projectile-completion-system 'ivy
	projectile-switch-project-action 'projectile-dired
	projectile-require-project-root nil))

(setq-default tab-width 2)

(use-package subword
  :config (global-subword-mode 1))

(setq compilation-scroll-output t)

(use-package eglot)

(use-package css-mode
  :config
  (setq css-indent-offset 2))

(use-package scss-mode
  :config
  (setq scss-compile-at-save nil))

(use-package less-css-mode)

(use-package go-mode)
(use-package go-errcheck)
(use-package company-go)

(setenv "GOPATH" "/home/zach/code/go")
(zb/append-to-path (concat (getenv "GOPATH") "/bin"))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '(company-go))
            (company-mode)
            (if (not (string-match "go" compile-command))
                (set (make-local-variable 'compile-command)
                     "go build -v && go test -v && go vet"))
            (flycheck-mode)))

(use-package haskell-mode)

(add-hook 'haskell-mode-hook
          (lambda ()
            (haskell-doc-mode)
            (turn-on-haskell-indent)))

(zb/append-to-path "~/.cabal/bin")

(use-package coffee-mode)

(setq js-indent-level 2)

(add-hook 'coffee-mode-hook
          (lambda ()
            (yas-minor-mode 1)
            (setq coffee-tab-width 2)))

(use-package paredit)

(use-package rainbow-delimiters)

(setq lispy-mode-hooks
      '(clojure-mode-hook
        emacs-lisp-mode-hook
        lisp-mode-hook
        scheme-mode-hook))

(dolist (hook lispy-mode-hooks)
  (add-hook hook (lambda ()
                   (setq show-paren-style 'expression)
                   (paredit-mode)
                   (rainbow-delimiters-mode))))

(use-package eldoc
  :config
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode))

(use-package flycheck-package)

(eval-after-load 'flycheck
  '(flycheck-package-setup))

(use-package python-mode)

(zb/append-to-path "~/.local/bin")

(use-package elpy)
(elpy-enable)

(add-hook 'elpy-mode-hook 'flycheck-mode)

(use-package py-autopep8)
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(use-package company-jedi)
(add-to-list 'company-backends 'company-jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(use-package rust-mode
  :config
  (zb/append-to-path "~/.cargo/bin")
  (setq rust-format-on-save t))

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(use-package yaml-mode)

(defun zb/term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

(add-hook 'term-mode-hook
          (lambda ()
            (goto-address-mode)
            (define-key term-raw-map (kbd "C-y") 'zb/term-paste)
            (define-key term-raw-map (kbd "<mouse-2>") 'zb/term-paste)
            (define-key term-raw-map (kbd "M-o") 'other-window)
            (setq yas-dont-activate t)))

(setq initial-major-mode 'org-mode)

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook 'org-bullets-mode))

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(setq org-src-window-setup 'current-window)

(add-to-list 'org-structure-template-alist
             '("el" . "src emacs-lisp"))

(setq org-adapt-indentation nil)

(setq org-directory "~/Documents/org")

(defun org-file-path (filename)
  "Return the absolute address of an org file, given its relative name."
  (concat (file-name-as-directory org-directory) filename))

(setq org-inbox-file "~/sync/Dropbox/inbox.org")
(setq org-index-file (org-file-path "index.org"))
(setq org-archive-location
      (concat (org-file-path "archive.org") "::* From %s"))

(defun zb/copy-tasks-from-inbox ()
  (when (file-exists-p org-inbox-file)
    (save-excursion
      (find-file org-index-file)
      (goto-char (point-max))
      (insert-file-contents org-inbox-file)
      (delete-file org-inbox-file))))

(setq org-agenda-files (list org-index-file
                             (org-file-path "events.org")
                             (org-file-path "goals.org")
                             (org-file-path "recurring-events.org")
                             (org-file-path "work.org")))

(defun zb/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))

(define-key org-mode-map (kbd "C-c C-x C-s") 'zb/mark-done-and-archive)

(setq org-log-done 'time)

(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)

(setq org-agenda-start-on-weekday nil)

(require 'org-habit)

(defun zb/org-skip-subtree-if-priority (priority)
  "Skip an agenda subtree if it has a priority of PRIORITY.

PRIORITY may be one of the characters ?A, ?B, or ?C."
  (let ((subtree-end (save-excursion (org-end-of-subtree t)))
        (pri-value (* 1000 (- org-lowest-priority priority)))
        (pri-current (org-get-priority (thing-at-point 'line t))))
    (if (= pri-value pri-current)
        subtree-end
      nil)))

(defun zb/org-skip-subtree-if-habit ()
  "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
  (let ((subtree-end (save-excursion (org-end-of-subtree t))))
    (if (string= (org-entry-get nil "STYLE") "habit")
        subtree-end
      nil)))

(setq org-agenda-custom-commands
      '(("p" "Personal agenda"
         ((agenda "")
          (todo "TODO"
                ((org-agenda-skip-function '(or (zb/org-skip-subtree-if-priority ?A)
                                                (zb/org-skip-subtree-if-habit)))
                 (org-agenda-overriding-header "Other tasks:")))
          (todo "PENDING"
                ((org-agenda-skip-function '(zb/org-skip-subtree-if-priority ?A))
                 (org-agenda-overriding-header "Pending:")))
          (todo "BLOCKED"
                ((org-agenda-skip-function '(zb/org-skip-subtree-if-priority ?A))
                 (org-agenda-overriding-header "Blocked:")))))))

(defun zb/dashboard ()
  (interactive)
  (zb/copy-tasks-from-inbox)
  (find-file org-index-file)
  (org-agenda nil "p"))

(global-set-key (kbd "C-c d") 'zb/dashboard)

(setq org-capture-templates
      '(("b" "Blog idea"
         entry
         (file "~/Documents/notes/blog-ideas.org")
         "* %?\n")

        ("c" "Contact"
         entry
         (file "~/Documents/contacts.org")
         "* %(org-contacts-template-name)
:PROPERTIES:
:ADDRESS: %^{123 Fake St., City, ST 12345}
:PHONE: %^{555-555-5555}
:EMAIL: %(org-contacts-template-email)
:NOTE: %^{note}
:END:")

        ("d" "Delivery" entry
         (file+headline "~/Documents/org/events.org" "Deliveries")
         "** %?\n   SCHEDULED: %t\n")

        ("e" "Email" entry
         (file+headline org-index-file "Inbox")
         "* TODO %?\n\n%a\n\n")

        ("f" "Finished book"
         table-line (file "~/Documents/notes/books-read.org")
         "| %^{Title} | %^{Author} | %u |")

        ("s" "Subscribe to an RSS feed"
         plain
         (file "~/Documents/rss-feeds.org")
         "*** [[%^{Feed URL}][%^{Feed name}]]")

        ("t" "Todo"
         entry
         (file+headline org-index-file "Inbox")
         "* TODO %?\n:PROPERTIES:\nCREATED: %u\n:END:\n")))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(defun zb/open-index-file ()
  "Open the master org TODO list."
  (interactive)
  (zb/copy-tasks-from-inbox)
  (find-file org-index-file)
  (flycheck-mode -1)
  (end-of-buffer))

(global-set-key (kbd "C-c i") 'zb/open-index-file)

(defun org-capture-todo ()
  (interactive)
  (org-capture :keys "t"))

(global-set-key (kbd "M-n") 'org-capture-todo)
(add-hook 'gfm-mode-hook
          (lambda () (local-set-key (kbd "M-n") 'org-capture-todo)))
(add-hook 'haskell-mode-hook
          (lambda () (local-set-key (kbd "M-n") 'org-capture-todo)))

(defun zb/open-work-file ()
  "Open the work TODO list."
  (interactive)
  (find-file (org-file-path "work.org"))
  (flycheck-mode -1)
  (end-of-buffer))

(global-set-key (kbd "C-c w") 'zb/open-work-file)

(require 'ox-md)
(require 'ox-beamer)

(setq org-confirm-babel-evaluate nil)

(use-package htmlize)

(setq org-export-with-smart-quotes t)

(setq org-html-postamble nil)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

(setenv "BROWSER" "firefox")

(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)

(setq TeX-PDF-mode t)

(setq-default TeX-engine 'default)
(setq TeX-parse-self t)
;; (latex-preview-pane-enable)

(use-package auctex-lua)
(use-package auctex-latexmk)
(use-package textmate)
(use-package cdlatex)
(use-package latex-extra)
(use-package latex-math-preview)
(use-package latex-unicode-math-mode)
(use-package ebib)

(add-hook 'LaTeX-mode-hook
          (lambda ()
            (LaTeX-math-mode)
            (setq TeX-master t)))

(defun zb/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/configuration.org"))

(global-set-key (kbd "C-c e") 'zb/visit-emacs-config)

(defun zb/kill-current-buffer ()
  "Kill the current buffer without prompting."
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'zb/kill-current-buffer)

(zb/append-to-path "/usr/local/bin")

(save-place-mode t)

(setq-default indent-tabs-mode nil)

(use-package which-key
  :config (which-key-mode))

(use-package yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets/text-mode"))
(yas-global-mode 1)

(setq yas-indent-line 'auto)

(defun zb/split-window-below-and-switch ()
  "Split the window horizontally, then switch to the new pane."
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(defun zb/split-window-right-and-switch ()
  "Split the window vertically, then switch to the new pane."
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'zb/split-window-below-and-switch)
(global-set-key (kbd "C-x 3") 'zb/split-window-right-and-switch)

(projectile-global-mode)

(use-package engine-mode)
(require 'engine-mode)

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(defengine youtube
  "https://www.youtube.com/results?search_query=%s")

(engine-mode t)

(define-key input-decode-map "\e[1;2A" [S-up])
