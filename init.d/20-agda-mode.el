
(require 'agda2-mode)
(set-face-foreground 'agda2-highlight-function-face "#00ced1")
(set-face-foreground 'agda2-highlight-datatype-face "#adff2f")
(set-face-foreground 'agda2-highlight-record-face "#adff2f")
(set-face-foreground 'agda2-highlight-postulate-face "#adff2f")
(set-face-foreground 'agda2-highlight-primitive-face "#adff2f")
(set-face-foreground 'agda2-highlight-primitive-type-face "#adff2f")

(set-face-foreground 'font-lock-function-name-face "#00ced1")
(set-face-foreground 'highlight "#000000")
(set-face-background 'highlight "#00ff00")

(custom-set-variables
 '(agda2-include-dirs
   (quote
    ("." "/usr/share/agda-stdlib" "/home/seagull/src/agda/agda-prelude")) )  )
