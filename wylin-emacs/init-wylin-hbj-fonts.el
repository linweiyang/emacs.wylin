;; https://raw.githubusercontent.com/baohaojun/system-config/master/.emacs_d/lisp/bhj-fonts.el
;; https://www.cnblogs.com/taosim/articles/3272555.html
(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s-%s" font-name font-size)))

(defvar bhj-english-font-size nil)
(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-fonts-scale
                       )
  (setq chinese-fonts-scale (or chinese-fonts-scale 1.2))
  (save-excursion
    (with-current-buffer (find-file-noselect "~/.config/system-config/emacs-font-size")
      (delete-region (point-min) (point-max))
      (insert (format "%s" english-font-size))
      (save-buffer)
      (kill-buffer)))
  (setq face-font-rescale-alist `(("Microsoft Yahei" . ,chinese-fonts-scale)
                                  ("Microsoft_Yahei" . ,chinese-fonts-scale)
                                  ("微软雅黑" . ,chinese-fonts-scale)
                                  ("WenQuanYi Zen Hei" . ,chinese-fonts-scale)))
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (setq bhj-english-font-size english-font-size)
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts))))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (set-face-attribute
     'default nil :font en-font)
    (condition-case font-error
        (progn
          (set-face-font 'italic (font-spec :family "Courier New" :slant 'italic :weight 'normal :size (+ 0.0 english-font-size)))
          (set-face-font 'bold-italic (font-spec :family "Courier New" :slant 'italic :weight 'bold :size (+ 0.0 english-font-size)))

          (set-fontset-font t 'symbol (font-spec :family "Courier New")))
      (error nil))
    (set-fontset-font t 'symbol (font-spec :family "Unifont") nil 'append)
    (set-fontset-font t nil (font-spec :family "DejaVu Sans"))

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font t charset zh-font)))
  (when (and (boundp 'global-emojify-mode)
             global-emojify-mode)
    (global-emojify-mode 1))
  (shell-command-to-string "sawfish-client -e '(maximize-window (input-focus))'&"))


(defvar bhj-english-fonts '("Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New"))
(defvar bhj-chinese-fonts '("Microsoft Yahei" "Microsoft_Yahei" "微软雅黑" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

(qiang-set-font
 bhj-english-fonts
 (if (file-exists-p "~/.config/system-config/emacs-font-size")
     (save-excursion
       (find-file "~/.config/system-config/emacs-font-size")
       (goto-char (point-min))
       (let ((monaco-font-size (read (current-buffer))))
         (kill-buffer (current-buffer))
         (if (numberp monaco-font-size)
             monaco-font-size
           12.5)))
   12.5)
 bhj-chinese-fonts)

(defvar chinese-font-size-scale-alist nil)

;; On different platforms, I need to set different scaling rate for
;; differnt font size.
(cond
 ((and (boundp '*is-a-mac*) *is-a-mac*)
  (setq chinese-font-size-scale-alist '((10.5 . 1.3) (11.5 . 1.3) (16 . 1.3) (18 . 1.25))))
 ((and (boundp '*is-a-win*) *is-a-win*)
  (setq chinese-font-size-scale-alist '((11.5 . 1.25) (16 . 1.25))))
 (t ;; is a linux:-)
  (setq chinese-font-size-scale-alist '((12.5 . 1.25) (14 . 1.25) (16 . 1.25) (20 . 1.25)))))

(defvar bhj-english-font-size-steps '(9 10.5 11.5 12.5 14 16 18 20 22))
(defun bhj-step-frame-font-size (step)
  (let ((steps bhj-english-font-size-steps)
        next-size)
    (when (< step 0)
        (setq steps (reverse bhj-english-font-size-steps)))
    (setq next-size
          (cadr (member bhj-english-font-size steps)))
    (when next-size
        (qiang-set-font bhj-english-fonts next-size bhj-chinese-fonts (cdr (assoc next-size chinese-font-size-scale-alist)))
        (message "Your font size is set to %.1f" next-size))))

(global-set-key [(control x) (meta -)] (lambda () (interactive) (bhj-step-frame-font-size -1)))
(global-set-key [(control x) (meta +)] (lambda () (interactive) (bhj-step-frame-font-size 1)))

(set-face-attribute 'default nil :font (font-spec))

;; {%org-mode%}
;; here are 20 hanzi and 40 english chars, see if they are the same width
;; 你你你你你你你你你你你你你你你你你你你你
;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/
;; {%/org-mode%}
