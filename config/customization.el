;; Themes
(use-package doom-themes :ensure t :defer t)
(use-package monokai-theme :ensure t :defer t)
(use-package dracula-theme :ensure t :defer t)

(load-theme 'doom-Iosvkem t)
(doom-themes-neotree-config)

;; Font
(add-to-list 'default-frame-alist '(font . "FantasqueSansMono Nerd Font 15"))
(setq frame-resize-pixelwise t)
