(autoload 'doxygen-insert-function-comment "doxygen" "insert comment for the function at point" t)
(autoload 'doxygen-insert-file-comment "doxygen" "insert comment for file" t)
(autoload 'doxygen-insert-member-group-region "doxygen" "insert comment for member group" t)
(autoload 'doxygen-insert-compound-comment "doxygen" "insert comment for compound" t)

(defun my-cc-init-hook ()
  "Initialization hook for CC-mode runs before any other hooks."
  (setq c-doc-comment-style
        '((java-mode . javadoc)
          (pike-mode . autodoc)
          (c-mode    . javadoc)
          (c++-mode  . javadoc)))
  (set-face-foreground 'font-lock-doc-face
                       (face-foreground font-lock-comment-face)))
(add-hook 'c++-initialization-hook 'my-cc-init-hook)
;;(my-cc-init-hook)

(provide 'init-doxygen)
