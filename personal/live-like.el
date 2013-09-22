;; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with C-x C-f,
;; then enter the text in that file's own buffer.

(require 'mic-paren)

(paren-activate)

(require 'highlight)
(require 'nrepl-eval-sexp-fu)
(setq nrepl-eval-sexp-fu-flash-duration 0.5)

(set-face-attribute 'nrepl-eval-sexp-fu-flash
                    nil
                    :foreground nil
                    :background nil
                    :inverse-video t
                    :weight 'bold)
