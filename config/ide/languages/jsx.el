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
