

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
(toggle-frame-maximized)

; extra
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))


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

; Zerodark "Dark Theme"
(use-package zerodark-theme :ensure t)
(require 'zerodark-theme :ensure t)
(load-theme 'zerodark t)


;---;
; 4 ; Packages
;---;

;; Ecb
;(use-package ecb :ensure t)
;(require 'ecb)
;(ecb-activate)

;; Auto-Pause
(use-package auto-pause :ensure t)
(require 'auto-pause)

;; Ace Window
(use-package ace-window :ensure t)
(require 'ace-window)
(global-set-key (kbd "M-o") 'ace-window)

;; Latex
(use-package latex-preview-pane :ensure t)
(require 'latex-preview-pane)

;; Markdown
(use-package markdown-mode :ensure t)
(require 'markdown-mode)
(use-package eww :ensure t)
(require 'eww)
(use-package markdown-preview-eww :ensure t)
(require 'markdown-preview-eww)
(use-package markdown-preview-mode :ensure t)

;; Elisp
(use-package elisp-lint :ensure t)
(require 'elisp-lint)

;; Magin
(use-package magit :ensure t)
(require 'magit)

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


;; Neotree && Projectile
(use-package neotree :ensure t)
(require 'neotree)
(neotree-toggle)
(global-set-key [f8] 'neotree-toggle)

(use-package projectile :ensure t)
(require 'projectile)
;(setq neo-smart-open t)
;(setq projectile-switch-project-action 'neotree-projectile-action)


;---;
; 6 ; Language Modes
;---;

;; Python Mode
(use-package python-mode :ensure t)
(require 'python-mode)

;; Matlab Mode
(if (not (package-installed-p 'matlab-mode))
(progn
  (package-refresh-contents)
  (package-install 'matlab-mode)))
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; Julia Mode
(use-package julia-shell :ensure t)
(use-package julia-mode :ensure t)
(autoload 'julia-mode "julia" "Julia Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.jl$" . julia-mode))

;(require 'julia-mode)

;---;
; 7 ; Extra Functions
;---;

;-----;
; end ; AUTO-SYSTEM
;-----;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (julia-mode zerodark-theme use-package tabbar python-mode projectile neotree matlab-mode markdown-preview-mode markdown-preview-eww magit latex-preview-pane flycheck elisp-lint ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
