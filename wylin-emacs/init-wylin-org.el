(require-package 'org-bullets)
(require 'org-bullets)

(add-hook 'org-mode-hook
          (lambda () (org-bullets-mode 1)))

(provide 'init-wylin-org)
