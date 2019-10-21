(setq-default
  tab-width 4
  standard-indent 4
  indent-tabs-mode nil)		
(setq scroll-conservatively 101)
(electric-pair-mode)
(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'dart-mode-hook 'rainbow-delimters-mode)
  :ensure t)
(setq auto-window-vscroll nil)

(setq evil-insert-state-cursor '(box "green")
      evil-normal-state-cursor '(box "white")
      evil-replace-state-cursor '(box "red")
      evil-visual-state-cursor '(box "yellow"))
