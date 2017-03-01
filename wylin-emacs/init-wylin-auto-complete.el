;; auto-complete 
(require-package 'auto-complete)

(require 'auto-complete)
(require 'auto-complete-config)
(setq-default ac-expand-on-auto-complete t)
(setq-default ac-auto-start t)
(setq-default ac-dwim t) ; To get pop-ups with docs even if a word is uniquely completed

;;使用增强列表
(require-package 'pos-tip)
(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)
;;启用默认ac设置
(ac-config-default)
(auto-complete-mode 1)
;;添加backspac触发列表
(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))
;;使用帮助模式
(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)
;;开启ac-dwin
(setq ac-dwim t)
;;设置ac数据文件位置
;;(setq ac-comphist-file (expand-file-name "ac-comphist/ac-comphist.dat" prelude-savefile-dir))
;;(check-temp-dir (expand-file-name "ac-comphist/" prelude-savefile-dir))
;;添加ac补全源
(set-default 'ac-sources
             '(ac-source-semantic ;;ac使用semantic的分析结果
               ac-source-yasnippet
               ac-source-abbrev
               ac-source-words-in-buffer
               ac-source-words-in-all-buffer
               ac-source-imenu
               ac-source-files-in-current-dir
               ac-source-filename))

;;yasnippet补全源的界面显示设置，这里颜色是红色的，用来与ac本身的补全相区分
(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

(provide 'init-wylin-auto-complete)
