;; Themes
(use-package doom-themes :ensure t :defer t)
(use-package afternoon-theme :ensure t :defer t)
(use-package spacemacs-theme :ensure t :defer t)

(load-theme 'doom-one t)
(doom-themes-neotree-config)

;; Font
(add-to-list 'default-frame-alist '(font . "Operator Mono 14"))
(setq frame-resize-pixelwise t)
