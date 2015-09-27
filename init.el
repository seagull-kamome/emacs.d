;;; -*- mode: lisp-interaction; syntax: elisp -*-
;;;
;;; Time-stamp: <00/06/23 21:13:19 seagull>
;;;

;; パスを通す
;;(setq load-path (cons "~/lib/elisp/" load-path))
;;(setq load-path (cons "~/share/emacs/site-lisp" load-path))

;; auto-install
(setq load-path (cons "~/.emacs.d/auto-install" load-path))
(when (require 'auto-install nil t)
  (auto-install-compatibility-setup)
)

(require 'package)
(package-initialize)

(setq init-loader-show-log-after-init nil)
(require 'init-loader)
(init-loader-load "~/.emacs.d/init.d")


(require 'custom)
(setq semantic-load-turn-useful-things-on t)

(require 'cl)
(require 'jka-compr)
(auto-compression-mode t)

(setq mailcap-file "/etc/mailcap")

(define-key isearch-mode-map "\C-k" 'isearch-edit-string)


;; abbrev
(setq abbrev-file-name "~/.abbrev")
(quietly-read-abbrev-file)
(setq save-avvrevs t)


(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))


(setq scroll-step 2)
(setq next-line-add-newlines nil)
(setq resize-minibuffer-mode t)  ; ミニバッファの大きさを自動的に変える
(menu-bar-mode t)
(tool-bar-mode)

;   日本語向けに設定し直す
(if (>= emacs-major-version 20)
    (progn
      (setq sentence-end
	    (concat 
	     "\\("
	     "\\("
	     "[.?!][]\"')}]*"                        "\\|"
	     "[．？！][］”’）｝〕〉》」』]*"
	     "\\)"       "\\($\\|\t\\|  \\)"             "\\|"
	     "[。．？！]"
	     "\\)"
	     "[ \t\n]*"
	     )
	    )
      (setq paragraph-start         "^[ 　\t\n\f]")
      (setq paragraph-separate      "^[ 　\t\f]*$")
) )





(defun apache-jakarta-mode ()
  "The Java mode specialization for Apache Jakarta projects."
  (if (not (assoc "apache-jakarta" c-style-alist))
      ;; Define the Apache Jakarta cc-mode style.
      (c-add-style "apache-jakarta" '("java" (indent-tabs-mode . nil)))  )

  (c-set-style "apache-jakarta")
  (c-set-offset 'substatement-open 0 nil)
  (setq mode-name "Apache Jakarta")

  ;; Turn on syntax highlighting when X is running.
  (if (boundp 'window-system)
      (progn (setq font-lock-support-mode 'lazy-lock-mode)
             (font-lock-mode t))))

;; Activate Jakarta mode.
(if (fboundp 'jde-mode)
    (add-hook 'jde-mode-hook 'apache-jakarta-mode)
  (add-hook 'java-mode-hook 'apache-jakarta-mode)
  )



;; W3m
(require 'w3m-search)
(add-to-list 'w3m-search-engine-alist '("rfc" "http://localhost:1978/node/rfc/search_ui?phrase=%s&attr1=&attr2=&attr3=&order=&max=50&depth=5" utf-8))
(setq w3m-use-cookies t)
;(setq browse-url-browser-function 'w3m-browse-url)
(global-set-key "\C-c\C-m" 'browse-url)


(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "google-chrome")


; Navi2ch
(setq navi2ch-list-bbstable-url "http://azlucky.s25.xrea.com/2chboard/bbsmenu2.html")
(setq navi2ch-article-auto-range nil)
(setq navi2ch-bm-stay-board-window nil)
;(require 'navi2ch-async)



;;
;;
;;
;;(require 'ghc)
;(autoload 'ghc-init "ghc" nil t)
;(add-hook 'haskell-mode-hook (lambda ()
;  (setq ghc-module-command "/usr/bin/ghc-mod")
;  (ghc-init)
;  (flymake-mode t)
;  (turn-on-haskell-decl-scan)
;  ;(turn-on-font-lock)
;  ;(turn-on-haskell-doc-mode)
;  (turn-on-haskell-indent)
;  ;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;  ;(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
;  ;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
;  (setq haskell-literate-default 'latex)
;  (setq haskell-doc-idle-delay 0)
;  (local-set-key "\C-cd" 'ghc-flymake-display-errors)
;))
(add-hook 'haskell-cabal-mode-hook (lambda () (setq 'indent-tabs-mode nil)))
(setq auto-mode-alist
      (append auto-mode-alist
	      '(("\\.hs$"  . haskell-mode)
		("\\.hi$"  . haskell-mode)
		("\\.hsc$" . haskell-mode)
		("\\.chs$" . haskell-mode)
		("\\.lhs$" . literate-haskell-mode))))

(add-hook 'idris-mode-hook (lambda () (turn-on-idris-indentation)))


;(setq interpreter-mode-alist
;      (append interpreter-mode-alist
;	      '(("^#!.*runhaskell" . haskell-mode))))

;(autoload 'haskell-mode "haskell-mode"
;  "Major mode for editing Haskell scripts." t)
;(autoload 'literate-haskell-mode "haskell-mode"
;  "Major mode for editing literate Haskell scripts." t)
;;(autoload 'turn-on-haskell-ghci "haskell-ghci"
;;  "Turn on interaction with a GHC interpreter." t)
;

;(require 'hoogle)


;; howm
;;
(require 'howm)
(setq howm-view-use-grep t)
(setq howm-view-summary-persistent nil)
(setq howm-directory "~/MyDocument/howm/")

(global-set-key "\C-c,l" 'howm-list-recent)
(global-set-key "\C-c,c" 'howm-create)

(defun howm-open-from-calendar ()
  "カレンダー上の日付に対応したファイル名の howm メモを開く."
  (interactive)
  (require 'howm-mode)
  (let* ((mdy (calendar-cursor-to-date t))
	 (m (car mdy))
	 (d (second mdy))
	 (y (third mdy))
	 (ti (encode-time 0 0 0 d m y))
	 (pc (howm-folder-get-page-create howm-directory (howm-file-name ti)))
	 (page (car pc))
	 (createp (cdr pc)))
    (other-window 1)
    (howm-page-open page)
    (if createp
	(howm-create-here)
      (howm-set-mode))))
(require 'calendar)
(define-key calendar-mode-map "c" 'howm-open-from-calendar)


(setq gcb-many-windows t)
(setq gcb-use-separate-io-buffer t)


(require 'twittering-mode)
(setq twittering-initial-timeline-spec-string
      '(":home"
	":replies"
	":favorites"
	":direct_messages"
;;	":search/emacs/"
	"うへへへ")
      )

;;
(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(color-theme-selection "dark blue 2" nil (color-theme))
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("e4bc8563d7651b2fed20402fe37b7ab7cb72869f92a3e705907aaecc706117b5" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(display-time-mode t)
 '(ecb-auto-activate t)
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-layout-name "right1")
 '(ecb-options-version "2.32")
 '(ecb-source-path (quote ("/home/seagull/src")))
 '(ecb-type-tag-expansion
   (quote
    ((default "class" "interface" "group" "namespace")
     (cc-mode "struct"))))
 '(ecb-use-speedbar-instead-native-tree-buffer (quote dir))
 '(ede-project-directories (quote ("/home/seagull/src/Haskell/Jobnet")))
 '(global-auto-complete-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(ledger-binary-path "/usr/bin/ledger")
 '(ledger-report-format-specifiers
   (quote
    (("ledger-file" . ledger-report-ledger-file-format-specifier)
     ("PAYEE" . ledger-report-payee-format-specifier)
     ("account" . ledger-report-account-format-specifier)
     ("value" . ledger-report-value-format-specifier))))
 '(ledger-reports
   (quote
    (("本日残高" "ledger -f %(ledger-file) bal -e tomorrow")
     ("月末予定残高" "ledger -f %(ledger-file) bal -e nextmonth")
     ("期末予定残高" "ledger -f %(ledger-file) bal -e nextquater")
     ("入力済残高" "ledger -f %(ledger-file) bal")
     ("reg" "ledger -f %(ledger-file) reg")
     ("payee" "ledger -f %(ledger-file) reg @%(payee)")
     ("account" "ledger -f %(ledger-file) reg %(account)")
     ("income" "ledger -f %(ledger-file) incomestatement")
     ("cashflow" "ledger -f %(ledger-file) cashflow"))))
 '(line-number-mode t)
 '(magit-wip-mode t)
 '(prolog-program-name "/usr/bin/yap")
 '(safe-local-variable-values (quote ((syntax . elisp))))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode -1)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-track-mouse-flag t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(put 'narrow-to-region 'disabled nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'set-goal-column 'disabled nil)
