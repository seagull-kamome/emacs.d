
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
(blink-cursor-mode -1)
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

(autoload 'ansi-color-for-comint-mode-on "ansi-color" "Set `ansi-color-for-comint-mode' to t." t)

(win:startup-with-window)
(define-key ctl-x-map "C" 'see-you-again)

(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(global-linum-mode 1)


(set-default-font "Bitstream Vera Sans Mono-7")
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









