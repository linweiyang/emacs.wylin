;;(global-set-key "\d" 'delete-char)
(when *is-a-mac*
  (global-set-key (kbd "¥") "\\") ;; for my hhkb lite keyboard.

  ;; Fix iedit bug in Mac
  (require-package 'iedit)
  (define-key global-map (kbd "C-c ;") 'iedit-mode)
  )

(global-set-key "\C-h" 'backward-delete-char)

(provide 'init-wylin-key)
