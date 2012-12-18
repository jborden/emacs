;; Flymake for java files using checkstyle
;; 
;; Checkstyle can be found at:
;; http://checkstyle.sourceforge.net/
;;
;; This file is based off of my personal setfly.el file
;;

(require 'flymake)
(defun flymake-checkstyle-java-init ()
  "Use checkstyle to check the style of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "/usr/bin/java"  (list  "-cp \"/Users/James/src/checkstyle-5.5/*\" com.puppycrawl.tools.checkstyle.Main -c /Users/james/src/checkstyle-5.5/sun_checks.xml" local))))

(add-to-list 'flymake-err-line-patterns
  '("\\(\\w+.java\\):\\([0-9]+\\):[0-9]*[:, ]*\\(.+\\)" 1 2 nil 3))
;; regex for php
;; "\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$"
;;Documentation: 
;; flymake-err-line-patterns is a variable defined in `flymake.el'.
;;Patterns for matching error/warning lines.  Each pattern has the form
;;(REGEXP FILE-IDX LINE-IDX COL-IDX ERR-TEXT-IDX).
(add-to-list 'flymake-allowed-file-name-masks '("\\.java$" flymake-checkstyle-java-init))
;; important: needed to load flymake with the mode
(add-hook 'find-file-hook 'flymake-mode)
