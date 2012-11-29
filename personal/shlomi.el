
(add-hook 'nrepl-interaction-mode-hook
  'nrepl-turn-on-eldoc-mode)
;; Auto-completion for Clojure
(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(menu-bar-mode 1)

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete" '(add-to-list 'ac-modes 'nrepl-mode))
(defun set-auto-complete-as-completion-at-point-function () (setq completion-at-point-functions '(auto-complete)))
(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
(cua-mode 1)
(defun lambda-as-lambda (mode pattern)
  (font-lock-add-keywords
   mode `((,pattern
           (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                     "λ" 'decompose-region)))))))
;; Setup lambdas
(lambda-as-lambda 'clojure-mode "(\\(\\<fn\\>\\)")
(lambda-as-lambda 'emacs-lisp-mode "(\\(\\<lambda\\>\\)")
(add-hook 'prog-mode-hook 'turn-off-guru-mode t)
(add-hook 'prog-mode-hook 'whitespace-turn-off t)

(add-hook 'text-mode-hook 'turn-off-flyspell t)
(add-hook 'prog-mode-hook 'turn-off-flyspell t)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")
