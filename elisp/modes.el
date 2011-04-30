;; modes.el
;; James Borden
;; settings for different modes

;; Path which contains php manual 
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
;; Many commands in Org work on the region if the region is active. 
;; To make use of this, you need to have transient-mark-mode (zmacs-regions in XEmacs) turned on. 
;;In Emacs 23 this is the default, in Emacs 22 you need to do this yourself with
(transient-mark-mode 1)