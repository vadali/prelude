
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

(add-hook 'haskell-mode-hook 'turn-off-guru-mode t)
(add-hook 'haskell-mode-hook 'whitespace-turn-off t)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")

;a workaround for https://github.com/capitaomorte/yasnippet/issues/289
(add-hook 'term-mode-hook (lambda() (yas-minor-mode -1)))


; tramp
(require 'tramp)
(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(setq tramp-default-method "scp")

;(add-to-list 'load-path "~/.emacs.d/tramp/lisp/")
;(add-to-list 'tramp-default-proxies-alist  '("ec2-107-22-50-177.compute-1.amazonaws.com" nil "/ssh:ubuntu@ec2-107-22-50-177.compute-1.amazonaws.com:"))

(tramp-set-completion-function "ssh"
  '((tramp-parse-sconfig "/etc/ssh_config")
    (tramp-parse-sconfig "~/.ssh/config")))

(setq password-cache-expiry nil)

(add-to-list 'tramp-remote-path "/home/ubuntu/ginger")

; if a file is remote, show where its at
(defconst my-mode-line-buffer-identification
  (list
   '(:eval
     (let ((host-name
            (if (file-remote-p default-directory)
                (concat  (tramp-file-name-host
                          (tramp-dissect-file-name default-directory)) ": ")
              (""))))
       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
           (substring host-name 0 (match-beginning 1))
         host-name)))
   "%12b"))

(setq-default
 mode-line-buffer-identification
 my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (setq
     mode-line-buffer-identification
     my-mode-line-buffer-identification)))
