;; To reload this file, M-x load-file RET ~/.emacs RET
;; C-h v to describe a particular variable
;; Begin Personal settings for James Borden

;; I use the Common Lisp stuff all the time 
;; This is required for labels
(require 'cl)

;; Default encoding using UTF-8
(set-language-environment "utf-8")

;; load up lisp files (modes, configuration, etc) from home dir
(defvar emacs-root "/Users/james/emacs/")
;; I want to know exactly what emacs is loading so I will set load-path to nil
;(setq load-path nil)
;; add all the elisp directories under ~/emacs to my load path
(labels ((add-path (p) ; new function add-path, given argument p 
		   (add-to-list 'load-path ; definition of add-path, uses function add-to-list (add-to-list LIST-VAR ELEMENT) to add elements to load-path 
				(concat emacs-root p)))) ; element to add, which is actually a call to concat so that the emacs-root dir can be appened to p
  ;; below, this function is called to add paths to load-path
  (add-path "elisp")    ; all my personal elisp code
  (add-path "php")      ; php customization
  (add-path "yaml")     ; yaml mode
  ;;  (add-path "geben")    ; geben for php debugging
  (add-path "org-mode/lisp") ; org-mode
  (add-path "org-mode/contrib") ; org-mode conributions
  (add-path "java")             ; java mode
  (add-path "minor-modes")      ; dir which contains minor modes
  (add-path "clojure")          ; dir which contains clojure-mode files
  (add-path "clojurescript-mode") ; clojurescript mode
  (add-path "subshell-proc")      ; required by clojurescript-mode
  (add-path "slime")            ; dir for slime
  (add-path "yasnippet")        ; dir for yasnippets
  ;;  (add-path "nxhtml")           ; nxhtml mode 
  (add-path "python-mode")      ; python mode
  )
;;  (add-path "emacs/icicles") 
;; setup the mit-scheme program
(setenv "MITSCHEME_LIBRARY_PATH"
	"/Applications/mit-scheme.app/Contents/Resources")
;; icicles for minibuffer stuff
;; Load files with settings that I use
(load-library "setfly")  ;; setup makefly 
(load-library "ekeys")   ;; key bindings
(load-library "tabstop") ;; setup tab stops
(load-library "myfont")  ;; settings for fonts and windows colors
;;(load-library "autostart") ;; autoload nxhtml
(load-library "css-mode")  ;; load css mode
(load-library "utilities") ;; setting for loading various utilities
(load-library "javac") ;; javac minor mode
(load-library "rainbow-mode") ;; rainbow minor mode for css
(load-library "clojure-mode") ;; clojure mode for clojure
(load-library "subshell-proc") ;; required by clojurescript-mode
(load-library "clojurescript-mode") ;; clojurescript-mode
(load-library "defadvice")    ;; advice for commands
(load-library "yasnippet")    ;; yasnippets
(load-library "python-mode-init") ;; start up python mode
(load-library "move-line-region") ;; move regions up and down with M-<up> and M-<down>
(load-library "paredit")          ;; checks parenthesis for you
(load-library "modes")   ;; settings for my modes
(yas-global-mode 1)           ;; make yasnippets work everywhere
;;(load-library "icicles") ;; load the icicles library OB
;; End Personal Settings for James Borden
;;(member "/Users/james/emacs/php" load-path)
;;(setq load-path (delq 'rose flowers)

;; loading up geben-mode
(add-to-list 'load-path "~/emacs/geben")
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path (quote ("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Users/james/src/emacs-24.1/nextstep/Emacs.app/Contents/MacOS/bin" "/Users/james/bin")))
 '(flymake-gui-warnings-enabled nil)
 '(fringe-mode 0 nil (fringe))
 '(inferior-lisp-program "/usr/local/bin/clisp")
 '(ispell-program-name "/usr/local/bin/Aspell")
 '(javac-classpath ":/Users/james/src/selenium-2.22.0/com/*:/Users/james/src/selenium-2.22.0/org/*:/Users/james/src/selenium-2.22.0/libs/*:/Users/james/src/selenium-2.22.0/*" t)
 '(org-clock-modeline-total (quote current))
 '(org-support-shift-select (quote always))
 '(slime-backend "/Users/james/emacs/slime/swank-loader.lisp")
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; I don't want any beeps or sounds playing!
(setq ring-bell-function 
      (lambda ()))


;; set the default font
(set-frame-font "Monaco Regular 22")
;; run the emacs server on startup
(server-start)

(assoc "\\.html" auto-mode-alist)
(setq tab-stop-list nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

