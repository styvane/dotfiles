
;; -*- lexical-binding: t; -*-

(use-package package
  :ensure nil
  :config
  (package-initialize)
  :custom
  (package-native-compile t)
  (package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                      ("melpa" . "https://melpa.org/packages/")))
  (package-selected-packages
   '(auto-dark clang-format company flymake-ruff go-mode lsp-mode
               ocamlformat rainbow-delimiters ruff-format rustic
               smlfmt sqlformat toml-mode yaml-mode zig-mode)))


;;; ----- Basic Configuration -----

;; Core settings
(setq
 ;; Don't warn on advice
 ad-redefinition-action 'accept

 ;; Instruct auto-save-mode to save to the current file, not a backup file
 ;;auto-save-default nil

 ;; Revert Dired and other buffers
 global-auto-revert-non-file-buffers t

 ;; Yes, this is Emacs
 initial-scratch-message nil

 ;; Yes, this is Emacs
 inhibit-startup-message t

 ;; Yes, this is Emacs
 inhibit-startup-screen t

 inhibit-startup-echo-area-message t

 ;; Don't warn on large files
 large-file-warning-threshold nil

 ;; No backup files, please
 make-backup-files nil

 ;; Silence compiler warnings as they can be pretty disruptive
 native-comp-async-report-warnings-errors nil

 ;; Make it easy to cycle through previous items in the mark ring
 set-mark-command-repeat-pop t

 ;; Follow symlinks to VC-controlled files without warning
 vc-follow-symlinks t

 ;; Flash the UI instead of beeping
 visible-bell t
 backup-directory-alist '(("" . "~/.saves")))

;; Core modes
(blink-cursor-mode 0)          ;; Disable cursor blinking
(column-number-mode 1)         ;; Show column number on mode line
(delete-selection-mode 1)      ;; Enable delete section
(display-time-mode 1)          ;; Display time in mode line / tab bar
(fido-vertical-mode 1)         ;; Improved vertical minibuffer completions
(global-visual-line-mode 1)    ;; Visually wrap long lines in all buffers
(menu-bar-mode 0)              ;; Hide the menu bar
(repeat-mode 1)                ;; Enable repeating key maps
(savehist-mode 1)              ;; Save minibuffer history
(scroll-bar-mode 0)            ;; Hide the scroll bar
(tab-bar-history-mode 1)       ;; Remember previous tab window configurations
(tool-bar-mode t)              ;; Hide the tool bar
(xterm-mouse-mode t)           ;; Enable mouse events in terminal Emacs

;; Prevent extranous tabs
(setq-default indent-tabs-mode nil)

;; Delete trailing whitespace before saving buffers
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Allow switching to neighbouring windows using shift<left>,
;; shift<right> shift<up>, and shift<down>
(windmove-default-keybindings)

;; Move customization settings out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file t))


;;; ----- Appearance -----

;; Make vertical window separators look nicer in terminal Emacs
(set-display-table-slot standard-display-table 'vertical-border (make-glyph-code ?│))

;; Clean up the mode line
(setq-default mode-line-format
              '("%e" "  "
                (:propertize
                 ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote))
                mode-line-frame-identification
                mode-line-buffer-identification
                "   "
                mode-line-position
                mode-line-format-right-align
                "  "
                (project-mode-line project-mode-line-format)
                " "
                (vc-mode vc-mode)
                "  "
                mode-line-modes
                mode-line-misc-info
                "  ")
              project-mode-line t
              mode-line-buffer-identification '(" %b")
              mode-line-position-column-line-format '(" %l:%c"))

;; Display line numbers in programming modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(setq display-line-numbers-type 'relative)


;; Customize face
(when (display-graphic-p)
  (set-face-attribute 'default nil
                      :font "MonoLisa Variable"
                      :weight 'medium
                      :height 140))


;;; ----- Package Configuration -----

;; Custome themes
(use-package modus-themes
  :ensure t
  :config
  (setq
     modus-themes-italic-constructs t
     modus-themes-custom-auto-reload t
     modus-themes-disable-other-themes t
     modus-themes-common-palette-overrides modus-themes-preset-overrides-intense)

  :custom
  (modus-themes-completions '((t semibold)))
  (modus-themes-common-palette-overrides
   `(
     (fringe unspecified)
     (rainbow-1 indigo)
     (rainbow-4 rust)))

  (modus-operandi-palette-overrides
   `(
     (bg-main "#f8f9f4")
     (bg-active bg-main)
     (fg-main "#191d2d")
     (fg-active fg-main)
     (bg-line-number-inactive "#ccb7ae")
     (fg-mode-line-active "#14213d")
     (bg-region "#cbd9e3")
     (fg-region "#2c363c")
     (keyword red-intense)
     (docstring "#15243e")
     (type black)
     (preprocessor yellow-warmer)))

   (modus-vivendi-palette-overrides
   `(
     (bg-main "#252422")
     (bg-active bg-main)
     (bg-line-number-inactive "#403d39")
     (string "#fde992")
     (type "#f4f3ee")
     (docstring olive)
     (constant "#ffb4a2")
     (preprocessor red-warmer))))


;; Auto dark mode configuration
(use-package auto-dark
  :ensure t
  :custom
  (auto-dark-themes '((modus-vivendi) (modus-operandi)))
  (auto-dark-allow-osascript t)
  :init (auto-dark-mode))

;; rainbow mode for delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Language server configuration with LSP
(use-package lsp-mode
   :ensure t
   :commands (lsp lsp-deferred)
   :bind-keymap ("C-c l" . lsp-command-map)
   :hook ((go-mode . lsp-deferred)
          (go-mode . go-fmt-before-save)
          (go-mode . lsp-organize-imports)
          ;;(yaml-mode . flymake-yaml-load)
          ;;(haskell-mode . lsp)
          ;;(haskell-literate-mode . lsp)
          (zig-mode . lsp))

   ;;:custom
   :config
   (setq lsp-log-io nil) ; if set to true can cause a performance hit
   (setq lsp-lens-enable nil)
   (setq lsp-enable-snippet nil)
   (setq lsp-headerline-breadcrumb-enable nil))

;; Rustic configuration
(use-package rustic
  :ensure t
  :hook (rustic-mode . (lambda () (flymake-mode -1)))
  :config
  (setq rustic-format-on-save t)
  :custom
  (rustic-cargo-use-last-stored-arguments t))

;; Ocaml formatting configuration
(use-package ocamlformat
  :custom (ocamlformat-enable 'enable-outside-detected-project)
  :hook (before-save . ocamlformat-before-save))

;; Ruff configuration
(use-package flymake-ruff
  :hook (python-mode . flymake-ruff-load))

;; Ruff formatting configuration
(use-package ruff-format
  :hook (python-mode . ruff-format-on-save-mode))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; Clang Format configuration
(use-package clang-format
  :commands (clang-format-buffer clang-format-on-save-mode)
  :hook (c-mode c++-mode protobuf-mode)
  :config
  (setq clang-format-fallback-style '"llvm")
  (clang-format-on-save-mode))

;; SQL formatter
(use-package sqlformat
  :config
  (setq sqlformat-command 'pgformatter)
  (add-hook 'sql-mode-hook 'sqlformat-on-save-mode))

;; YAML mode configuration
(use-package yaml-mode
   :config
   (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

;; TOML mode configuration
(use-package toml-mode :ensure t)


;;; ----- Custom tool configuration -----

;; Make sure ripgrep is used everywhere
(setq xref-search-program 'ripgrep
      grep-command "rg -nS --noheading")

;; Auto insert
;; (auto-insert-mode)  ;;; Adds hook to find-files-hook
;; (setq auto-insert-directory "~/.emacs-templates/") ;;; Or use custom, *NOTE* Trailing slash important
;; (setq auto-insert-query nil) ;;; If you don't want to be prompted before insertion
