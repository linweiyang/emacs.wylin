;;(set-face-attribute 'default nil :height font_size)
(when *is-a-mac*
  (set-face-attribute 'default nil :font "Monaco 16" :height font_size);;  ;; ;;
  (set-fontset-font "fontset-default" 'gb18030' ("Microsoft YaHei" . "unicode-bmp"))
  )

(defun s-font ()
  (interactive)
  ;; font config for org table showing.
  ;;  (set-default-font "monospace-11")
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font)
                      charset
                      (font-spec :family "Microsoft YaHei" :size 16)
                      ))
  ;; tune rescale so that Chinese character width = 2 * English character width
  ;;(setq face-font-rescale-alist '(("monospace" . 1.0) ("WenQuanYi" . 1.0)))
  )

(add-to-list 'after-make-frame-functions
             (lambda (new-frame)
               (select-frame new-frame)
               (if window-system
                   (s-font))))
(if window-system
    (s-font))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (set-language-environment 'Chinese-GB)        ;;
;; (set-keyboard-coding-system 'euc-cn)          ;;
;; (set-clipboard-coding-system 'euc-cn)         ;;
;; (set-terminal-coding-system 'euc-cn)          ;;
;; (set-buffer-file-coding-system 'euc-cn)       ;;
;; (set-selection-coding-system 'euc-cn)         ;;
;; (prefer-coding-system 'euc-cn)                ;;
;; (setq default-process-coding-system 'euc-cn)  ;;
;; (setq-default pathname-coding-system 'euc-cn) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-chinese-code)
