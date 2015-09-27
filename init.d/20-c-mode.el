(require 'cpputils-cmake)

(defun my-c-mode-hook-proc ()
  (c-set-style "linux")

  (c-set-offset 'inline-open 0)
  (c-set-offset 'innamespace 0)

  (setq c-tab-always-indent t)
  (setq c-auto-newline nil)
  (setq indent-tabs-mode t)

  (flycheck-mode t)
  (auto-complete-mode t)
  (cppcm-reload-all)
  (setq helm-make-build-dir cppcm-build-dir)

  (define-key c-mode-map (kbd "C-c c") 'compile)

  (develock-mode nil)
  )
(global-set-key (kbd "C-c c") 'compile)

(add-hook 'c-mode-common-hook 'my-c-mode-hook-proc)

;; OPTIONAL, somebody reported that they can use this package with Fortran
(add-hook 'c90-mode-hook (lambda () (cppcm-reload-all)))
;; OPTIONAL, avoid typing full path when starting gdb
;;(global-set-key (kbd "C-c C-g")
;;		'(lambda ()(interactive) (gud-gdb (concat "gdb --fullname " (cppcm-get-exe-path-current-buffer)))))
;; OPTIONAL, some users need specify extra flags forwarded to compiler
;;(setq cppcm-extra-preprocss-flags-from-user '("-I/usr/src/linux/include" "-DNDEBUG"))
