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

;;------------设置(utf-8)模式------------
(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t)


(provide 'init-chinese-code)
