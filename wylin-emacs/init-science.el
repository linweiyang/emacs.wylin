(require-package 'matlab-mode)
(require 'matlab-mode)
;; matlab shell
;; matlab-emacs
(add-to-list 'load-path "path/to/matlab-emacs")
(load-library "matlab-load")
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(setq auto-mode-alist (cons '("//.m//'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq fill-column 76)) ; where auto-fill should wrap
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
(defun my-matlab-shell-mode-hook ()
  '())
(add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
(global-font-lock-mode t)
                                        ;(matlab-mode-hilit)
(autoload 'tlc-mode "tlc" "tlc Editing Mode" t)
(add-to-list 'auto-mode-alist '("//.tlc{1}quot; . tlc-mode))

(setq tlc-indent-function t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(matlab-mode-install-path (quote ("/Applications/MATLAB_R2014b.app/toolbox/")))
 '(matlab-shell-ask-MATLAB-for-completions nil)
 '(matlab-shell-command "/Applications/MATLAB_R2014b.app/bin/matlab")
 '(matlab-shell-enable-gud-flag t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; client
;;(server-start)

(provide 'init-science)
