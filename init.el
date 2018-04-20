;; Varun's Emacs Configuration

;; Saving Emacs Startup time
(setq gc-cons-threshold 100000000)

;; Packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(use-package diminish :ensure t)
(use-package bind-key :ensure t)

;; Text Editing
(setq tab-width 4)
(electric-pair-mode)
(use-package rainbow-delimiters :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) :ensure t)
(use-package evil :init (evil-mode) :ensure t)

;; Line Numbers
(global-linum-mode t)

;; Font
(add-to-list 'default-frame-alist '(font . "FuraCode Nerd Font"))

;; Themes
(use-package molokai-theme :ensure t :defer t)
(use-package monokai-theme :ensure t :defer t)
(use-package zenburn-theme :ensure t :defer t)
(use-package color-theme-sanityinc-tomorrow :ensure t :defer t)
(use-package dracula-theme :ensure t :defer t)
(use-package alect-themes :ensure t :defer t)
(use-package solarized-theme :ensure t :defer t)
(use-package material-theme :ensure t :defer t)
(load-theme 'solarized-dark t)

;; Spaceline
(use-package spaceline
  :ensure t
  :config
  (spaceline-spacemacs-theme)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state))

;; Snippets
(use-package yasnippet :ensure t :defer t)
(use-package yasnippet-snippets :ensure t :defer t)
(yas-global-mode)

;; Autocomplete
(use-package company
  :init (company-mode)
  :ensure t)

;; Python Development
(use-package elpy
  :ensure t
  :init (elpy-enable))

;; Gradle
(use-package gradle-mode
  :defer t
  :ensure t)
(use-package groovy-mode
  :defer t
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
;; Homescreen
(use-package page-break-lines :ensure t)
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-banner-logo-title "Varun Ramani's Emacs Configuration")
  (setq dashboard-startup-banner 'logo))


;; Growing some Ivy
(use-package counsel
  :ensure t
  :defer t)
(use-package ivy
  :ensure t)

;; Projectile
(use-package projectile
  :ensure t
  :defer t)


;; Disable GUI trash
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-window-fringes nil 0 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (material-theme zenburn-theme yasnippet-snippets use-package spaceline solarized-theme rebecca-theme projectile monokai-theme molokai-theme evil dracula-theme diminish dashboard dakrone-theme counsel color-theme-sanityinc-tomorrow arjen-grey-theme alect-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
