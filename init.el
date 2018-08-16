;; Saving Emacs Startup time
(setq gc-cons-threshold 50000000)

(add-hook 'emacs-startup-hook 'my/set-gc-threshold)
(defun my/set-gc-threshold ()
  "Reset `gc-cons-threshold' to its default value."
  (setq gc-cons-threshold 800000))

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

;; Disable GUI trash
(use-package ace-popup-menu
  :ensure t
  :init (ace-popup-menu-mode))
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(set-window-fringes nil 0 0)

;; Enable GUI nontrash
(use-package all-the-icons :ensure t :defer t)
(use-package neotree
  :ensure t
  :defer t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

;; (y/n)
(fset 'yes-or-no-p 'y-or-n-p)

;; Modeline
(display-time-mode 1)


;; Org mode settings
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook #'org-bullets-mode)
(setq org-agenda-files '("~/Dropbox/org/Events.org" "~/Dropbox/org/Tasks.org"))

;; Font
(add-to-list 'default-frame-alist '(font . "FuraCode Nerd Font 12"))
(setq frame-resize-pixelwise t)

;; Themes
(use-package doom-themes :ensure t :defer t)
(use-package monokai-theme :ensure t :defer t)
(use-package dracula-theme :ensure t :defer t)

(load-theme 'dracula t)

;; Snippets
(use-package yasnippet :ensure t :defer t)
(use-package yasnippet-snippets :ensure t :defer t)
(yas-global-mode)

;; Autocomplete
(use-package company
  :ensure t)
(use-package company-lsp
  :ensure t)
(add-hook 'prog-mode-hook 'company-mode)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; Python Development
(use-package elpy
  :ensure t
  :init (elpy-enable))

;; Web development
(use-package web-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

;; Dart/Flutter
(use-package dart-mode
  :ensure t
  :defer t
  :config
  (setq dart-enable-analysis-server t))

(use-package markdown-mode
  :ensure t)

;; C/C++
(setq-default c-basic-offset 4)
(use-package cquery :ensure t)
(setq cquery-executable "/usr/bin/cquery")
(add-hook 'c-mode-common-hook #'lsp-cquery-enable)

;; JSX
(use-package json-mode :ensure t)
(use-package rjsx-mode :ensure t
  :config
  (setq js2-basic-offset 4)
  (setq typescript-indent-level 4)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))
(defun setup-tide-mode ()
  "Set up Tide mode."
  (interactive)
  (tide-setup)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))
(use-package tide
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'rjsx-mode-hook #'setup-tide-mode))

;; Homescreen
(use-package page-break-lines :ensure t)
(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-banner-logo-title "Varun Ramani's Emacs Configuration")
  (setq dashboard-startup-banner 'logo)
  (setq dashboard-items '((agenda . 5))))

;; Git Integration
(use-package magit
  :ensure t)

;; Projectile
(use-package projectile
  :ensure t
  :init (projectile-mode))

;; Completion System 
(use-package ivy
  :ensure t
  :defer t
  :init (ivy-mode)
  :config
  (setq ivy-count-format "(%d/%d) "))
(use-package counsel :ensure t :defer t)
(use-package counsel-projectile :ensure t :defer t)


;; Really epic and awesome keybindings 
(use-package evil :init (evil-mode) :ensure t)
(use-package evil-multiedit :ensure t :config (evil-multiedit-default-keybinds))

(use-package general
  :ensure t
  :init (general-evil-setup))

(general-nmap
  :prefix "SPC f"

  "o" 'dired)

(general-nmap
  :prefix "SPC o"

  "c p" 'org-latex-export-to-pdf)

(general-nmap
  :prefix "SPC c"

  "e" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
  "r" (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
  
(general-nmap
  :prefix "SPC"

  "b" 'ivy-switch-buffer)

(general-nmap
  :prefix "SPC p"

  "p" 'counsel-projectile-switch-project
  "f" 'counsel-projectile-find-file)

(general-nmap
  :prefix "SPC n"

  "f" 'neotree-dir
  "p" 'neotree-projectile-action

  "d" 'neotree-delete-node
  "c" 'neotree-copy-node
  "t" 'neotree-create-node)

(general-nmap
  :keymaps 'neotree-mode-map

  "RET" 'neotree-enter
  "TAB" 'neotree-quick-look)

(general-nmap
  :prefix "SPC"

  "SPC" 'counsel-M-x

  "q" 'evil-quit
  "w f" 'evil-write)

(general-nmap
  :prefix "SPC s"

  "h" (lambda () (interactive) (split-window-horizontally))
  "l" (lambda () (interactive) (split-window-horizontally) (evil-window-right 1))
  "j" (lambda () (interactive) (split-window-vertically) (evil-window-down 1))
  "k" (lambda () (interactive) (split-window-vertically)))

(general-nmap
  :prefix "SPC w"

  "h" 'evil-window-left
  "l" 'evil-window-right
  "j" 'evil-window-down
  "k" 'evil-window-up)

(general-nmap
  "/" 'swiper
  "SPC /" 'swiper-all)

(define-key ivy-mode-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-mode-map (kbd "C-k") 'ivy-previous-line)

;; Text Editing
(setq tab-width 4)
(setq scroll-conservatively 101)
(electric-pair-mode)
(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'dart-mode-hook 'rainbow-delimters-mode)
  :ensure t)
(setq auto-window-vscroll nil)
(setq default-tab-width 4)

;; Highlight Line
(global-hl-line-mode 1)

(use-package nlinum
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'nlinum-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (exwm tide yasnippet-snippets web-mode use-package rainbow-delimiters org-bullets nlinum neotree monokai-theme markdown-mode magit general evil-multiedit elpy doom-themes diminish dashboard dart-mode cquery counsel-projectile company-lsp ace-popup-menu))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
