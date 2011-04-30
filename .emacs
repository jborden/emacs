;; To reload this file, M-x load-file ENTER ~/.emacs ENTER
;; C-h v to describe a particular variable
;; Begin Personal settings for James Borden

;; I use the Common Lisp stuff all the time 
;; This is required for labels
(require 'cl)

;; Default encoding using UTF-8
(set-language-environment "utf-8")

;; load up lisp files (modes, configuration, etc) from home dir
(defvar emacs-root "/Users/james/emacs/")

;; add all the elisp directories under ~/emacs to my load path
(labels ((add-path (p) ;; new function add-path, given argument p 
	 (add-to-list 'load-path ;; definition of add-path, uses function add-to-list (add-to-list LIST-VAR ELEMENT) to add elements to load-path 
			(concat emacs-root p)))) ;; element to add, which is actually a call to concat so that the emacs-root dir can be appened to p
  ;; below, this function is called to add paths to load-path
  (add-path "elisp")    ;; all my personal elisp code
  (add-path "php")      ;; php customization
  (add-path "yaml")     ;; yaml mode
  (add-path "geben")    ;; geben for php debugging
  (add-path "org-mode/lisp") ;; org-mode
  (add-path "org-mode/contrib") ;; org-mode conributions
;;  (add-path "emacs/icicles") 
;; icicles for minibuffer stuff
)
;; Load files with settings that I use
(load-library "setfly")  ;; setup makefly 
(load-library "ekeys")   ;; key bindings
(load-library "modes")   ;; settings for my modes
(load-library "myfont")  ;; settings for fonts and windows colors
;;(load-library "icicles") ;; load the icicles library 
;; Load up nxhtml mode
;;(load (concat emacs-root "emacs/nxhtml/autostart.el"))
;; End Personal Settings for James Borden
;;(member "/Users/james/emacs/php" load-path)
;;(setq load-path (delq 'rose flowers)
 