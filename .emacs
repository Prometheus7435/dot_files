;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Author: Zach
;; Version: 0.1

(package-initialize)
;; (package-initialize)
;; (unless package-archive-contents
;;   (package-refresh-contents))
;; (package-install-selected-packages)
;; (setq python-shell-interpreter "C:\\Windows\\py.exe")
;; (setq python-shell-interpreter "C:\\Users\\zacha\\AppData\\Local\\Programs\\Python\\Python37-32\\python.exe")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (challenger-deep)))
 '(custom-safe-themes
   (quote
    ("4ce13ab8b7a8b44ed912a74312b252b0a3ad79b0da6b1034c0145b1fcfd206cb" "dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" "0bff60fb779498e69ea705825a2ca1a5497a4fccef93bf3275705c2d27528f2f" "f2755fc8f0b4269cc45032715b8e11ea2d768aae47b8bb2a256ca1c8fdeb3628" "6400c6eabcfb0789a82ccde9c819ad6cb6184a9da05027655624ecab019346a6" "aaffceb9b0f539b6ad6becb8e96a04f2140c8faa1de8039a343a4f1e009174fb" "e2e6ffe55113dfba8545db9722bc5235a03eee1e8c56b5edad8c4c5d04ae122e" "0d456bc74e0ffa4bf5b69b0b54dac5104512c324199e96fc9f3a1db10dfa31f3" "f153e8ed90e4d79cf2c61560da2b3091d2f3b94da42aaddc707012be4608cf52" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "2593436c53c59d650c8e3b5337a45f0e1542b1ba46ce8956861316e860b145a0" "d1cc05d755d5a21a31bced25bed40f85d8677e69c73ca365628ce8024827c9e3" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "f71859eae71f7f795e734e6e7d178728525008a28c325913f564a42f74042c31" "8dc7f4a05c53572d03f161d82158728618fb306636ddeec4cce204578432a06d" "c9b89349d269af4ac5d832759df2f142ae50b0bbbabcce9c0dd53f79008443c9" "02199888a97767d7779269a39ba2e641d77661b31b3b8dd494b1a7250d1c8dc1" "2540689fd0bc5d74c4682764ff6c94057ba8061a98be5dd21116bf7bf301acfb" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" "174502267725776b47bdd2d220f035cae2c00c818765b138fea376b2cdc15eb6" "e7b49145d311e86da34a32a7e1f73497fa365110a813d2ecd8105eaa551969da" "76dc63684249227d64634c8f62326f3d40cdc60039c2064174a7e7a7a88b1587" "1e9001d2f6ffb095eafd9514b4d5974b720b275143fbc89ea046495a99c940b0" "2a7beed4f24b15f77160118320123d699282cbf196e0089f113245d4b729ba5d" "83b1fda71a1cf78a596891c0cc10601e93d5450148f98e9b66dde80349b20195" "d8dc153c58354d612b2576fea87fe676a3a5d43bcc71170c62ddde4a1ad9e1fb" "190a9882bef28d7e944aa610aa68fe1ee34ecea6127239178c7ac848754992df" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "ee89863f86247942d9fc404d47b2704475b146c079c1dcd2390d697ddfa9bdf4" "87073e92c4437df15f127e18cb05b2832c99689201c4d81dee3c20c7197d62e7" "adde823697efd8b7532eb0406b60903310979b334e431f35d282399d6655512e" "0e6e456b15dbeb6e7bcad4131f029e027cceecc3cf1598fc49141343860bfce6" "f142c876b896c6ca19149cacd80ddd68a351f67f7fe3b786274ceee970276780" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" "5e52ce58f51827619d27131be3e3936593c9c7f9f9f9d6b33227be6331bf9881" "e3f648bb477a2e2332124f5ca8bd070e8624f152be6b4478668a69e5de7510ff" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" "d5b121d69e48e0f2a84c8e4580f0ba230423391a78fcb4001ccb35d02494d79e" "604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" "9b402e9e8f62024b2e7f516465b63a4927028a7055392290600b776e4a5b9905" "e9460a84d876da407d9e6accf9ceba453e2f86f8b86076f37c08ad155de8223c" "83db918b06f0b1df1153f21c0d47250556c7ffb5b5e6906d21749f41737babb7" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "938d8c186c4cb9ec4a8d8bc159285e0d0f07bad46edf20aa469a89d0d2a586ea" "ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
	  (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
			 (:color "#808080"))
     (implicitParams :underline
		     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#2e2e2e")
 '(hl-paren-colors
   (quote
    ("#B9F" "#B8D" "#B7B" "#B69" "#B57" "#B45" "#B33" "#B11")))
 '(inhibit-startup-screen t)
 '(linum-format "%3i")
 '(menu-bar-mode nil)
 '(muse-project-alist nil)
 '(notmuch-search-line-faces
   (quote
    (("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t))))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (tex-smart-umlauts zerodark-theme yatemplate writeroom-mode underwater-theme typo typit textmate srcery-theme solarized-theme rust-playground pabbrev ox-twbs ox-hugo overcast-theme org-edit-latex org-bullets night-owl-theme latex-unicode-math-mode latex-preview-pane latex-math-preview latex-extra html-to-markdown green-is-the-new-black-theme gotham-theme flycheck-rust exotica-theme espresso-theme ensime elpy ebib dracula-theme darkroom dakrone-theme cyberpunk-theme cheatsheet challenger-deep-theme cdlatex cargo auto-dictionary auto-complete auctex-lua auctex-latexmk abyss-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-color1 "#3d3d68")
 '(powerline-color2 "#292945")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(word-wrap t))
 '(visual-line-mode t)
 '(vc-annotate-background "#3b3b3b")
 '(vc-annotate-color-map
   (quote
    ((20 . "#dd5542")
     (40 . "#CC5542")
     (60 . "#fb8512")
     (80 . "#baba36")
     (100 . "#bdbc61")
     (120 . "#7d7c61")
     (140 . "#6abd50")
     (160 . "#6aaf50")
     (180 . "#6aa350")
     (200 . "#6a9550")
     (220 . "#6a8550")
     (240 . "#6a7550")
     (260 . "#9b55c3")
     (280 . "#6CA0A3")
     (300 . "#528fd1")
     (320 . "#5180b3")
     (340 . "#6380b3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")


; list the repositories containing them
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(setq my-onlinep nil)
(unless
    (condition-case nil
        (delete-process
         (make-network-process
          :name "my-check-internet"
          :host "elpa.gnu.org"
          :service 80))
      (error t))
  (setq my-onlinep t))

(setq my-packages
      '(elpy
;;	afternoon-theme
;;	borland-blue-theme
;;	calmer-forest-theme
	challenger-deep-theme
;;	color-theme-sanityinc-solarized
	cyberpunk-theme
	dakrone-theme
;;	distinguished-theme
;;	doneburn-theme
	dracula-theme
;;	eclipse-theme
	espresso-theme
	exotica-theme
	latex-preview-pane
	flycheck
	org
	pkg-info
;;	tablist
;;	xml-rpc
;;	xml+
;;	xml-quotes
;;	xmlgen
;;	pretty-symbols
	auctex-lua
	writeroom-mode
;;	prettify-greek
;;	ample-zen-theme
;;	arjen-grey-theme
;;	atom-dark-theme
	auto-complete
;;	badger-theme
;;	blackboard-theme
	cheatsheet
	darkroom
;;	darktooth-theme
;;	html-to-markdown
	auctex-latexmk
	abyss-theme
;;	airline-themes
;;	alect-themes
;;	atom-one-dark-theme
;;	badwolf-theme
	ebib
	tex-smart-umlauts
	textmate
;;	toxi-theme
	typit
	typo
	underwater-theme
;;	org2blog
;;	ox-hugo
	auto-dictionary
	cdlatex
	latex-extra
	latex-math-preview
	latex-unicode-math-mode
	markdown-mode
	org-edit-latex))

(when my-onlinep
  '(package-refresh-contents)
  (cl-loop for p in my-packages
           unless (package-installed-p p)
           do (package-install p)))


;; (setq package-list '(elpy afternoon-theme borland-blue-theme calmer-forest-theme challenger-deep-theme color-theme-sanityinc-solarized cyberpunk-theme dakrone-theme distinguished-theme doneburn-theme dracula-theme eclipse-theme espresso-theme exotica-theme latex-preview-pane flycheck org pkg-info tablist xml-rpc xml+ xml-quotes xmlgen pretty-symbols auctex-lua writeroom-mode prettify-greek ample-zen-theme arjen-grey-theme atom-dark-theme auto-complete badger-theme blackboard-theme cheatsheet darcula-theme darkroom darktooth-theme html-to-markdown auctex-latexmk abyss-theme airline-themes alect-themes atom-one-dark-theme badwolf-theme ebib tex-smart-umlauts textmate toxi-theme typit typo underwater-theme org2blog ox-hugo auto-dictionary cdlatex latex-extra latex-math-preview latex-unicode-math-mode markdown-mode org-edit-latex))

;; ; activate all the packages (in particular autoloads)
;; (package-initialize)

;; ; fetch the list of packages available 
;; (unless package-archive-contents
;;   (package-refresh-contents))

;; ; install the missing packages
;; (dolist (package package-list)
;;   (unless (package-installed-p package)
;;     (package-install package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 (set-default-font "Courier Prime Code-12" nil t)
;;  Courier Prime Code
;;  Inconsolata



(setq-default TeX-engine 'default) ;;change the default engine to XeTeX
;; (setq-default TeX-engine 'xetex) ;;change the default engine to XeTeX
;; (setq-default TeX-PDF-mode t)
;; (setq python-shell-interpreter "C:\Users\zacha\AppData\Roaming\Microsoft\Windows\Start\ Menu\Programs\Python\ 3.6")

;; (add-hook 'writeroom-mode-hook 'zenburn-emacs-nw)
(latex-preview-pane-enable)

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
