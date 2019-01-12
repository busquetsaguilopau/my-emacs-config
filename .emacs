

;---;
; 0 ; Internal features and gui
;---;

; gui elements
(menu-bar-mode 1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

; emacs startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)


;---;
; 1 ; Add Melpa repositories
;---;

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             ;'("melpa-stable" . "https://stable.melpa.org/packages/")
	     '("melpa" . "http://melpa.milkbox.net/packages/")
t)

;---;
; 2 ; Use-package for isntall packages
;---;

(if (not (package-installed-p 'use-package))
(progn
  (package-refresh-contents)
  (package-install 'use-package)))
(require 'use-package)


;---;
; 3 ; Themes
;---;

; Dracula
(use-package dracula-theme :ensure t)
(require 'dracula-theme)
'(custom-enabled-themes (quote (dracula)))

;---;
; 4 ; Packages
;---;

;; Flycheck
(use-package flycheck :ensure t)
(require 'flycheck)

;; TabBar Mode
(use-package tabbar :ensure t)
(require 'tabbar)
(tabbar-mode 1)
(setq tabbar-buffer-groups-function (lambda () '("group"))) ; all tabs in a single group
(setq tabbar-use-images nil) ; no use images

; tab navigation made easy
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
(global-set-key [M-down] 'next-buffer)

;; Neotree
(use-package neotree :ensure t)
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;---;
; 6 ; Language Modes
;---;

;; Python Mode
(use-package python-mode :ensure t)
(require 'python-mode)
(use-package flycheck-pycheckers :ensure t)
(require 'flycheck-pycheckers)

;; Matlab Mode
;(use-package matlab-mode :ensure t)
;(require 'matlab-mode)
;(matlab-cedet-setup)

;; Julia Mode
(use-package julia-mode :ensure julia-mode)
(use-package flycheck-julia :ensure flycheck-julia)
(require 'julia-mode)
(require 'flycheck-julia)
(flycheck-julia-setup)
;(add-to-list 'flycheck-global-modes 'julia-mode)

;-----;
; end ; AUTO-SYSTEM
;-----;
