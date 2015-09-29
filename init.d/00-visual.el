
(color-theme-initialize)
;;(color-theme-sitaramv-solaris)
;(color-theme-gtk-ide)
;;(color-theme-hober)
;(load-theme 'dark-krystal t)
(load-theme 'solarized-dark t)


(setq truncate-partial-width-windows nil)
(setq minibuffer-max-depth nil)
(setq visible-bell t)
(setq compilation-window-height 20)
(setq auto-save-default nil)

(setq default-frame-alist '((vertical-scroll-bars . nil)
			    (tool-bar-lines . 0)
			    (menu-bar-lines . 0)
			    (alpha . 100)
			    (fullscreen . nil)))
(blink-cursor-mode 0)
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" "Set `ansi-color-for-comint-mode' to t." t)

(win:startup-with-window)
(define-key ctl-x-map "c" 'see-you-again)

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(global-linum-mode t)
(column-number-mode t)

(setq scroll-step 10)
(setq next-line-add-newlines nil)
(setq resize-minibuffer-mode t)  ; ミニバッファの大きさを自動的に変える
(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(display-time-mode t)
(setq indicate-empty-lines t)
(show-paren-mode t)

(set-default-font "Bitstream Vera Sans Mono-7.5")n
(set-fontset-font (frame-parameter nil 'font)
		  'japanese-jisx0208
		  '("Takaoゴシック" . "unicode-bmp"))
;		  '("VLゴシック" . "unicode-bmp"))
;		  '("VL ゴシック" . "unicode-bmp"))
;				:family "VL ゴシック")))))
;				:family "Droid Sans Regular")))))
;				:family "atin Modern Math")))))
;				:family "DejaVu Mono Regular")))))
;				:family "小夏 等幅")))))
;				:family "Noto sans regular")))))
(setq default-line-spacing 0)
;(set-default-font "Dejavu Sans Mono 8")
;(set-fontset-font
; (frame-parameter nil 'font)
; 'japanese-jisx0208
; '("Droid Sans Japanese"))
; '("小夏 等幅"))









