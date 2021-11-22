(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)

(package-initialize)

;; rainbow mode for delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (;;(rust-mode . lsp)
	 (go-mode . lsp-deferred)))

(setq rust-format-on-save t)

;;(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
;;					 (lsp-format-buffer))))

;;(setq lsp-rust-server 'rust-analyzer)
;;(setq lsp-rust-analyzer-server-command '("~/.cargo/bin/rust-analyzer"))
(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(delete-selection-mode 1)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; formatting hook python-mode
(add-hook 'python-mode-hook 'blacken-mode)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; C/C++ coding style
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; SQL formatter

(setq sqlformat-command 'pgformatter)
;;(setq sqlformat-args '("-s2" "-g"))
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("" . "~/.saves")))
 '(blink-cursor-mode nil)
 '(inhibit-default-init t)
 '(inhibit-startup-echo-area-message "styvane")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(blacken sqlformat racket-mode rust-mode flymake-racket jq-format latex-math-preview docker-compose-mode dockerfile-mode latex-preview-pane google-c-style go-mode company lsp-mode toml-mode use-package rainbow-delimiters))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(windmove-default-keybindings)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd")))))
