(use-package rust-mode :ensure t)
(use-package racer :ensure t)
(use-package cargo :ensure t)
(add-hook 'rust-mode-hook 'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(use-package flymake-rust
  :ensure t)

