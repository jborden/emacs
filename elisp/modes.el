;; modes.el
;; James Borden
;; settings for different modes
;; Path which contains php manual 
;; Remember: hooks are variables, not functions!
(setq php-manual-path "~/emacs/php-chunked-xhtml")
;; Path for php-completion-file
(setq php-completion-file "~/emacs/php/php-completion-file")
;;(setq org-clock-idle-time 1)
;; When TODO is turned to DONE, entry is marked as "CLOSED: [timestamp]' 01-04-10 
(setq org-log-done 'time)
(setq fundamental-mode 'org-mode)
(setq initial-major-mode 'org-mode) 
;; default mode for txt files is org-mode
(add-to-list 'auto-mode-alist '(".txt" . org-mode))
;; change settings for default php-mode indentations to pear
(setq php-mode-force-pear 1)
;; Default yaml mode for yaml files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '(".yml$" . yaml-mode))
;; autoload geben
(autoload 'geben "geben" "PHP Debugger on Emacs" t)
;; Org-mode
(require 'org-install)
;; Hooks for org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'auto-fill-mode)
;; Many commands in Org work on the region if the region is active. 
;; To make use of this, you need to have transient-mark-mode (zmacs-regions in XEmacs) turned on. 
;;In Emacs 23 this is the default, in Emacs 22 you need to do this yourself with
(transient-mark-mode 1)
;; use nxhtml-mode for *.html, *.css, *.php and *.js
(add-to-list 'auto-mode-alist '("\\.html" . html-mode))
(add-to-list 'auto-mode-alist '("\\.css" . css-mode))
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php" . php-mode))
(add-to-list 'auto-mode-alist '("\\.js" . javascript-mode))
;; Use four spaces for tabs 
(setq tab-width 4)
(setq indent-tabs-mode nil)
;; use octave-mode for *.m files
(add-to-list 'auto-mode-alist '("\\.m" . octave-mode))
;; use markdownmode for *.md files
(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))
;; use my own javac minor mode when loading java files
(add-hook 'java-mode-hook 'javac-mode)
;; use rainbow mode when editing css files
(add-hook 'css-mode-hook 'rainbow-mode)
;; setup slime 
(setq inferior-lisp-program "/usr/local/bin/clisp") ; your Lisp system
(add-to-list 'load-path "~/emacs/slime")  ; your SLIME directory
(require 'slime)
(slime-setup)
;; uses paraedit mode on lisps
;;(add-hook 'clojure-mode 'paredit-mode)
;;(add-hook 'slime-repl-mode-hook ')
;; I don't like paredit mode, I just use electric-pair-mode, which
;; by default works on all buffers
(electric-pair-mode)
;; hooks for rainbow-delimiters
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojurescript-mode-hook 'rainbow-delimiters-mode)
;; hook for paredit for cider repl
(add-hook 'cider-repl-mode-hook #'paredit-mode)
