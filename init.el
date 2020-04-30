;; Make all commands of the “package” module present.
(require 'package)

;; Speef up start up by not loading any packages at startup.
;; (setq package-enable-at-startup nil)
;; Look at the *Messages* buffer before setting this to nil, then after.

;; Internet repositories for new packages.
(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ;; Maintainer is AWOL.
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ))

(add-to-list 'exec-path "/usr/local/bin")

;; Actually get “package” to work.
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;COMMON packages
;https://github.com/technomancy/better-defaults
(use-package better-defaults
  :ensure t)
; auto-complete
(use-package auto-complete
  :ensure t)
; highlight-parentheses
(use-package highlight-parentheses
  :ensure t)
; vim mode
(use-package evil
  :ensure t)
; easy-motion for emacs
(use-package avy
  :ensure t)
; git
(use-package magit
  :ensure t)

;; Project and files explore
;; http://tuhdo.github.io/helm-projectile.html#sec-1-1
; projectile
(use-package helm
  :ensure t)
(use-package projectile
  :ensure t)
(setq projectile-enable-caching t)
; helm-projectile
(use-package helm-projectile
  :ensure t)

;; Theme
; gruvbox-theme
(use-package gruvbox-theme
  :ensure t)
(load-theme 'gruvbox t)

(require 'evil)
(evil-mode t)

(require 'helm-config)
(require 'helm-projectile)

(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)

;; UI Config
; hide menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
; show line number
(global-linum-mode +1)
;
(global-visual-line-mode 1)

(helm-mode 1)
(helm-projectile-on)
(projectile-mode 1)
(projectile-global-mode 1)
(global-highlight-parentheses-mode 1)
(global-auto-complete-mode t)
(electric-pair-mode 1)

;; Key Mappings
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-projectile-find-file)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(evil-define-key 'normal global-map
  "\C-p" 'helm-mini
  "\C-x\C-f" 'helm-find-files
  "q:" 'helm-complex-command-history
  "\\\\w" 'evil-ace-jump-word-mode)

;(evil-ex-define-cmd "Exp[lore]" 'dired-jump)
;(evil-ex-define-cmd "color[scheme]" 'customize-themes)

;; NOTICE
; this config is not apply for all user, change it on your own
(setq projectile-project-search-path '("~/projects/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default)))
 '(package-selected-packages
   (quote
    (gruvbox-theme evil helm better-defaults ))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282827" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 125 :width normal :foundry "nil" :family "Monaco")))))
