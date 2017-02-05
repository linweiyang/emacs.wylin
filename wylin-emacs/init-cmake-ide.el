(require-package 'flycheck)
(require-package 'auto-complete-clang)
(require-package 'auto-complete-clang-async)
(require-package 'company)
(require-package 'helm)
(require-package 'irony)
(require-package 'rtags)
(require-package 'cmake-ide)

(require 'rtags) ;; optional, must have rtags installed
(require 'company-rtags)
(cmake-ide-setup)

(setq rtags-completions-enabled t)
(eval-after-load 'company
  '(add-to-list
    'company-backends 'company-rtags))
(setq rtags-autostart-diagnostics t)
(rtags-enable-standard-keybindings)

(setq rtags-use-helm t)

(add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

(provide 'init-cmake-ide)
