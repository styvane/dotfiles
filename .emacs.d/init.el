(use-package package
  :ensure nil
  :config
  (package-initialize)
  :custom
  (package-native-compile t)
  (package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                      ("melpa" . "https://melpa.org/packages/"))))

;; rainbow mode for delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Language server configuration with LSP
(use-package lsp-mode
   :ensure t
   :commands (lsp lsp-deferred)
   :hook ((go-mode . lsp-deferred)
          ;;(yaml-mode . flymake-yaml-load)
          ;;(haskell-mode . lsp)
          (zig-mode . lsp))
          ;;(haskell-literate-mode . lsp))
   ;;:custom
   :config
   (setq lsp-log-io nil) ; if set to true can cause a performance hit
   (setq lsp-lens-enable nil)
   (setq lsp-enable-snippet nil)
   (setq lsp-headerline-breadcrumb-enable nil))

(use-package rustic
  :ensure t
  :config
  (setq rustic-format-on-save t)
  :custom
  (rustic-cargo-use-last-stored-arguments t)
  (rustic-format-trigger 'on-save))

(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save))

(use-package flymake-ruff
  :hook (python-mode . flymake-ruff-load))

(use-package ruff-format
  :hook (python-mode . ruff-format-on-save-mode))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

(use-package clang-format
  :commands (clang-format-buffer clang-format-on-save-mode)
  :hook (asm-mode c-mode c++-mode protobuf-mode)
  :config
  (setq clang-format-fallback-style '"llvm"))

(use-package go-mode
  :after (lsp-mode)
  :config
  (go-fmt-before-save)
  (lsp-organize-imports))

;; SQL formatter
(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter)
  (add-hook 'sql-mode-hook 'sqlformat-on-save-mode))

(setq-default indent-tabs-mode nil)
(setq column-number-mode t)
(delete-selection-mode 1)

;; ;; Auto insert
;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; ;;(setq auto-insert-directory "~/.emacs-templates/") ;;; Or use custom, *NOTE* Trailing slash important
;; ;;(setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("" . "~/.saves")))
 '(blink-cursor-mode nil)
 '(eglot-confirm-server-edits nil nil nil "Customized with use-package eglot")
 '(inhibit-default-init t)
 '(inhibit-startup-echo-area-message "")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(flymake-ruff ruff-format clang-format rustic sqlformat zig-mode company go-mode rainbow-delimiters lsp-mode))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))

(windmove-default-keybindings)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd")))))
