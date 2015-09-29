;; howm
;;
(require 'howm)
(setq howm-view-use-grep t)
(setq howm-view-summary-persistent nil)
(setq howm-directory "~/ドキュメント/howm/")

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

