(use-package go-mode
  :ensure t
  :defer t)
(use-package company-go
  :ensure t
  :defer t)
(use-package exec-path-from-shell
  :ensure t)
(setq go-indent-level 4)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (require 'company-go)
  (set (make-local-variable 'company-backends) '(company-go))
  (exec-path-from-shell-copy-env "PATH"))
(add-hook 'go-mode-hook 'my-go-mode-hook)
