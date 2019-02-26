;; Core features of configuration
(load "~/.emacs.d/config/core/startup.el")
(load "~/.emacs.d/config/core/packageload.el")
(load "~/.emacs.d/config/core/interface.el")
(load "~/.emacs.d/config/core/editing.el")

;; Add IDE-like features to Emacs
(load "~/.emacs.d/config/ide/autocomplete.el")
(load "~/.emacs.d/config/ide/snippets.el")
(load "~/.emacs.d/config/ide/git.el")
(load "~/.emacs.d/config/ide/projectile.el")
(load "~/.emacs.d/config/ide/languages.el")

;; Nice keybindings for configuration
(load "~/.emacs.d/config/core/keybindings.el")

;; The customization file can be edited to change the look of Emacs
(load "~/.emacs.d/config/customization.el")
