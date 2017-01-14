;; -----------------------------------------------------------------------------
;; setting font for mac system
;; -----------------------------------------------------------------------------
;; Setting English Font
(setq font_size 160)


;; Chinese Font 配制中文字体                                          ;; ;; ;;
(dolist (charset '(kana han symbol cjk-misc bopomofo))                ;; ;; ;;         ;; ;;
  (set-fontset-font (frame-parameter nil 'font) ;; ;; ;;                               ;; ;;
                    charset                     ;; ;; ;;                               ;; ;;
                    (font-spec :family "Microsoft YaHei" :size 16))  ) ;; ;;        ;; ;; ;;

;; Note: you can chang "Kaiti SC" to "Microsoft YaHei" or other fonts ;; ;; ;;

;;(set-face-attribute 'default nil :height font_size)
(when *is-a-mac*
  (set-face-attribute 'default nil :font "Monaco 16" :height font_size);;  ;; ;;
  (set-fontset-font "fontset-default" 'gb18030' ("Microsoft YaHei" . "unicode-bmp"))
  )

;;(global-set-key "\d" 'delete-char)
(global-set-key "\C-h" 'backward-delete-char-untabify)
(when *is-a-mac*
  (global-set-key (kbd "¥") "\\")
  )
(setq ring-bell-function 'ignore)


(add-to-list 'load-path (expand-file-name "lisp/wylin-emacs" user-emacs-directory))
(sanityinc/add-subdirs-to-load-path (expand-file-name "lisp/wylin-emacs/" user-emacs-directory))

;; yasnippet
(require 'init-yasnippet)
(require 'init-ctags)
(require 'init-doxygen)
(require 'init-auctex)
;;(require 'init-science)
(require 'init-wylin-auto-complete)
(require 'init-wylin-cc-auto-complete)
(require 'init-transparency)
;;(require 'init-chinese-code)
(require 'init-plantuml)

(provide 'init-local)
