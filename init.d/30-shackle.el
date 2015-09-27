
(require 'shackle)
(setq shackle-default-rule '(:same t))
(setq shackle-rules
      '(
	(compilation-mode :align below :ratio 0.2)
	("\*helm buffers" :regexp t :align right :ratio 0.3)
	("\*helm flycheck" :regexp t :align bottom :ratio 0.3)
	("\*helm" :regexp t :align right :ratio 0.2)
	))
(shackle-mode t)
(setq shackle-lighter "")





