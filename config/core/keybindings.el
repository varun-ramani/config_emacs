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
  "f" 'counsel-projectile-find-file
  "c" 'projectile-compile-project)

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
  :prefix "SPC e"

  "s" 'eshell)

(general-nmap
  "/" 'swiper
  "SPC /" 'swiper-all)

(define-key ivy-mode-map (kbd "C-j") 'ivy-next-line)
(define-key ivy-mode-map (kbd "C-k") 'ivy-previous-line)
