(require-package 'auctex)

(defun wylin:auctex-init ()
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  ;; Enable synctex correlation
  (setq TeX-source-correlate-method 'synctex)
  ;; Enable synctex generation. Even though the command shows
  (custom-set-variables '(LaTeX-command "latex -synctex=1") )
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (cond
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Latex for Emacs in Windows
   ;;
   ;; Dependencies: SumatraPDF.exe, ctex, auctex
   ;;
   ;; SumatraPDF.exe setup:
   ;; 1.) Open SumatraPDF.exe and go to...
   ;; 2.) Settings -> Configure
   ;; 3.) Command should automatically set to:
   ;;    "d:\emacs-24.5\bin\emacsclient.exe" --no-wait +%l "%f"
   ;; 4.) inverse search: mouse double left clicks
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((eq system-type 'windows-nt)
    (if (executable-find "SumatraPDF.exe")
        (setq TeX-view-program-list
              '(("PDF Viewer" ("\"SumatraPDF.exe\" -reuse-instance"
                               (mode-io-correlate " -forward-search %b %n ") " %o"))))
      (message "SumatraPDF.exe is not found."))
    )

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Latex for Emacs in Mac OSX
   ;;
   ;; Dependencies: Skim, MacTeX, auctex
   ;;
   ;; Skim's displayline is used for forward search (from .tex to .pdf)
   ;; option -b highlights the current line; option -g opens Skim in the background
   ;;
   ;; Skim setup:
   ;; 1.) Open Skim and go to...
   ;; 2.) Preferences -> Sync
   ;; 3.) Command should automatically set to:
   ;;   a) Preset:   Custom
   ;;   b) Command:  /Applications/Emacs.app/Contents/MacOS/bin/emacsclient
   ;;   c) Argments: --no-wait +%line "%file"
   ;; 4.) Inverse search: command + shift + mouse left click
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ((eq system-type 'darwin)
    (if (executable-find "/Applications/Skim.app/Contents/SharedSupport/displayline")
        ;;"/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"
        (setq TeX-view-program-list
              '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b %n %o %b")))
      (message "Skim is not found."))
    )

   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   ;; Latex for Emacs in Ubuntu
   ;;
   ;; Dependencies: okular, texlive-full, auctex
   ;;
   ;; Okular setup:
   ;; 1.) Open Okular and go to...
   ;; 2.) Settings -> Configure Okular -> Editor
   ;; 3.) Set Editor to "Emacs client"
   ;; 4.) Command should automatically set to:
   ;;     emacsclient -a emacs --no-wait +%l %f
   ;; 5.) inverse search : shift + mouse left click
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   (t ;; for Linux OS
    (if (executable-find "okular")
        (setq TeX-view-program-list
              '(("PDF Viewer" "okular --unique %o#src:%n%b")))
      (message "okular is not found."))
    )
   )
  )

;; setting auctex, added by wylin
(add-hook 'LaTeX-mode-hook 'wylin:auctex-init)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'LaTeX-mode-hook                                                                         ;;
;;           (lambda()                                                                                     ;;
;;             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t)) ;;
;;             (setq TeX-command-default "XeLaTeX")))                                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;'(Latex-command "latex -synctex=1")

;; only start server for okular comms when in latex mode
(add-hook 'LaTeX-mode-hook 'server-start)
(setq TeX-PDF-mode t) ;; use pdflatex instead of latex

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Standard emacs/latex config
;; http://emacswiki.org/emacs/AUCTeX
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'ac-flyspell-workaround)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; flyspell-mode has a conflict of commom shortcuts, if you want to use it M-x flyspell-mode
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; enable auto-fill mode, nice for text
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; enable auto complete mode, added by wylin
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)
;; enable source correlate mode, for synctex
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'init-auctex)
