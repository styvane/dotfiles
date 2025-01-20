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
         (yaml-mode . flymake-yaml-load)
         (haskell-mode . lsp)
         (haskell-literate-mode . lsp))

  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  :config
  (setq lsp-lens-enable nil)
  (setq lsp-enable-snippet nil)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save))


;; Ruff config
(use-package flymake-ruff
    :ensure t
    :hook ((python-mode . flymake-ruff-load)
           ;; Formatting hook python-mode
           (python-mode . ruff-format-on-save-mode)))

(use-package eglot
  :ensure t
  :config
  :hook(haskell-mode . eglot-ensure)
  :config
  (setq-default eglot-workspace-configuration
                '((haskell
                   (plugin
                    (stan
                     (globalOn . :json-false))))))  ;; disable stan
  :custom
  (eglot-autoshutdown t)  ;; shutdown language server after closing last file
  (eglot-confirm-server-initiated-edits nil)  ;; allow edits without confirmation
)

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package clang-format
  :commands (clang-format-buffer clang-format-on-save-mode)
  :hook (c-mode c++-mode protobuf-mode)
  :config
  (setq clang-format-fallback-style '"llvm")
  (clang-format-on-save-mode))

(add-hook 'before-save-hook (lambda () (when (eq 'rust-mode major-mode)
					 (lsp-format-buffer))))

(add-hook 'before-save-hook (lambda () (when (eq 'go-mode major-mode)
					 (lsp-format-buffer)
                                          (lsp-organize-imports))))

(add-hook 'before-save-hook (lambda () (when (eq 'asm-mode major-mode)
					 (clang-format-buffer))))


(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(delete-selection-mode 1)

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
 '(eglot-confirm-server-edits nil nil nil "Customized with use-package eglot")
 '(inhibit-default-init t)
 '(inhibit-startup-echo-area-message "0x73656465")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(clang-format ruff-format flymake-yaml lsp-haskell ocamlformat eglot json-mode flymake-ruff caml typescript-mode protobuf-mode sqlformat racket-mode rust-mode jq-format latex-math-preview docker-compose-mode dockerfile-mode latex-preview-pane go-mode company lsp-mode toml-mode use-package rainbow-delimiters))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(windmove-default-keybindings)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd")))))
