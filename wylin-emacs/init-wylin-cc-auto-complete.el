;; auto-complete 
(require-package 'auto-complete)
(require 'auto-complete)
(require 'auto-complete-config)

;; auto-complete-c-headers
(require-package 'auto-complete-c-headers)
;; gcc -xc++ -E -v -  to check the include folders
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  ;;  (add-to-list 'achead:include-directories '"/Applications/Xcode.app")
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;;start flymake-google-cpplint-load
;;let's define a function for flymake initialization
;;step 1. install cpplint with "sudo pip install cpplint" command (install python-pip first)
(require-package 'flymake-google-cpplint)
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  )
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)
;; Flymake-google-style-mode

;; start google-c-style with emacs
(require-package 'google-c-style)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

;; install cedet mode for true intellisensep
(require 'semantic)
(semantic-mode 1)
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)


;; let's define a function which adds semantic as a suggestion backend to auto complete and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete ()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; Enable EDE (Project Management)
(global-ede-mode 1)

;; create a project for our program.
;;(ede-cpp-root-program "my project" : file "~/demos/my_program/src/main.cpp"
;;		      :include-path '("/../my_inc"))

;; you can use system-include-path for setting up the system header file locations.
;; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;; clang please see the youtube emacs C++

;; tab setting
(defun my-c-mode-hook ()
  (setq c-basic-offset 4          ;; 基本缩进宽度
        indent-tabs-mode t        ;; 禁止空格替换Tab
        default-tab-width 4));; 默认Tab宽度
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)


(provide 'init-wylin-cc-auto-complete)
