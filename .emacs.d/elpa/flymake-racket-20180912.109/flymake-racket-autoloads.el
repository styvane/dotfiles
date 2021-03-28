;;; flymake-racket-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flymake-racket" "flymake-racket.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from flymake-racket.el

(autoload 'flymake-racket-setup "flymake-racket" "\
Set up Flymake for Racket." t nil)

(autoload 'flymake-racket-add-hook "flymake-racket" "\
Add `flymake-racket-lint' to `flymake-diagnostic-functions'." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flymake-racket" '("flymake-racket-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flymake-racket-autoloads.el ends here
