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
  :hook ((rust-mode . lsp)
         (go-mode . lsp-deferred)
         (python-mode . flymake-ruff-load)
         (yaml-mode-hook . flymake-yaml-load)
         (haskell-mode . lsp)
         (haskell-literate-mode . lsp)

  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  :config
  (setq lsp-lens-enable nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save))


;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
					 (lsp-format-buffer))))

(add-hook 'before-save-hook (lambda () (when (eq 'go-mode major-mode)
					 (lsp-format-buffer)
                                          (lsp-organize-imports))))

(add-hook 'before-save-hook (lambda () (when (eq 'protobuf-mode major-mode)
					 (clang-format-buffer))))

(add-hook 'before-save-hook (lambda () (when (eq 'c-mode major-mode)
					 (clang-format-buffer))))

(add-hook 'before-save-hook (lambda () (when (eq 'asm-mode major-mode)
					 (clang-format-buffer))))


(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(delete-selection-mode 1)

;; C/C++ coding style
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; SQL formatter

(setq sqlformat-command 'pgformatter)
;;(setq sqlformat-args '("-s2" "-g"))
(add-hook 'sql-mode-hook 'sqlformat-on-save-mode)

;; Auto insert
(auto-insert-mode)  ;;; Adds hook to find-files-hook
;;(setq auto-insert-directory "~/.emacs-templates/") ;;; Or use custom, *NOTE* Trailing slash important
;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("" . "~/.saves")))
 '(blink-cursor-mode nil)
 '(inhibit-default-init t)
 '(inhibit-startup-echo-area-message "0x73656465")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(ruff-format async-status flymake-ruff caml typescript-mode clang-format protobuf-mode blacken sqlformat racket-mode rust-mode jq-format latex-math-preview docker-compose-mode dockerfile-mode latex-preview-pane google-c-style go-mode company lsp-mode toml-mode use-package rainbow-delimiters))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(windmove-default-keybindings)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd")))))
