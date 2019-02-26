(setq-default c-basic-offset 4)
(use-package cquery :ensure t)
(setq cquery-executable "/usr/bin/cquery")
(add-hook 'c-mode-common-hook #'lsp-cquery-enable)
