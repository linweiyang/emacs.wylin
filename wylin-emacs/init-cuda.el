;; for cuda mode
(require-package 'cuda-mode)
(require 'cuda-mode)

(add-to-list 'auto-mode-alist '("\\.cu\\'" . cuda-mode))

(provide 'init-cuda)
