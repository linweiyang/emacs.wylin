(require-package 'plantuml-mode)
(require 'plantuml-mode)

(let ((jar-name "plantuml.jar")
      (url "https://jaist.dl.sourceforge.net/project/plantuml/plantuml.jar"))
  (setq org-plantuml-jar-path (expand-file-name jar-name (file-name-directory user-init-file)))
  (unless (file-exists-p org-plantuml-jar-path)
    (url-copy-file url org-plantuml-jar-path)))

(provide 'init-plantuml)
