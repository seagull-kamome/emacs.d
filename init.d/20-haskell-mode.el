
(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-type 'cabal-repl)
 )

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  (define-key haskell-mode-map (kbd "C-c C-u") 'ghc-case-split)
  (define-key haskell-mode-map (kbd "C-c ?") 'helm-ghc-errors)
  ))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup) )

(add-hook 'haskell-mode-hook
	  '(lambda ()
	     (setq flycheck-checker 'haskell-hlint)
	     ; (setq flycheck-checker 'haskell-ghc)
	     ; (setq flycheck-disabled-checkers '(haskell-ghc))
	     (capitalized-words-mode)
	     (imenu-add-menubar-index)
	     (turn-on-haskell-decl-scan)
	     (turn-on-haskell-doc)
	     (turn-on-haskell-indentation)
	     ;;(structured-haskell-mode)
	     ;; (flycheck-mode)
	     (ghc-init)
	     (whitespace-newline-mode)
	     ) )

(add-hook 'haskell-cabal-mode-hook
	  '(lambda ()
	     (setq 'indent-tabs-mode nil)))


;; (haskell-notify-p t)
(setq haskell-tags-on-save t)

(haskell-process-auto-import-loaded-modules t)
(haskell-process-log t)
(haskell-process-suggest-remove-import-lines t)
(haskell-process-type (quote cabal-repl))


(setq auto-mode-alist
      (append auto-mode-alist
	      '(("\\.hs$"  . haskell-mode)
		("\\.hi$"  . haskell-mode)
		("\\.hsc$" . haskell-mode)
		("\\.chs$" . haskell-mode)
		("\\.lhs$" . literate-haskell-mode))))

