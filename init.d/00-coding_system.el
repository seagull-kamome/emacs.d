(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)

(set-default-coding-systems 'utf-8-unix)

(setq default-file-name-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8-unix)

(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(if (featurep 'Win32) (set-w32-system-coding-system 'sjis-dos))
(set-clipboard-coding-system 'utf-8-unix)
(setq network-coding-system-alist 
      '(("nnpt" . (junet-unix . junet-unix))
	(110 . (no-conversion . no-conversion))
	(25 . (no-conversion . no-conversion)) )  )

(set-input-method 'Agda)
