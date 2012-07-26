;; Support for Java

;;;###autoload
(defvar java-mode-syntax-table nil
  "Syntax table used in java-mode buffers.")
(or java-mode-syntax-table
    (setq java-mode-syntax-table
	  (funcall (c-lang-const c-make-mode-syntax-table java))))

(defvar java-mode-abbrev-table nil
  "Abbreviation table used in java-mode buffers.")
;;(c-define-abbrev-table 'java-mode-abbrev-table
;;  '(("else" "else" c-electric-continued-statement 0)
;;    ("while" "while" c-electric-continued-statement 0)
;;    ("catch" "catch" c-electric-continued-statement 0)
;;    ("finally" "finally" c-electric-continued-statement 0)))

(defvar java-mode-map ()
  "Keymap used in java-mode buffers.")
;;(if java-mode-map
;;    nil
;;;  (setq java-mode-map (c-make-inherited-keymap))
;;  add bindings which are only useful for Java
;;  )

;; Regexp trying to describe the beginning of a Java top-level
;; definition.  This is not used by CC Mode, nor is it maintained
;; since it's practically impossible to write a regexp that reliably
;; matches such a construct.  Other tools are necessary.
(defconst c-Java-defun-prompt-regexp
  "^[ \t]*\\(\\(\\(public\\|protected\\|private\\|const\\|abstract\\|synchronized\\|final\\|static\\|threadsafe\\|transient\\|native\\|volatile\\)\\s-+\\)*\\(\\(\\([[a-zA-Z][][_$.a-zA-Z0-9]*[][_$.a-zA-Z0-9]+\\|[[a-zA-Z]\\)\\s-*\\)\\s-+\\)\\)?\\(\\([[a-zA-Z][][_$.a-zA-Z0-9]*\\s-+\\)\\s-*\\)?\\([_a-zA-Z][^][ \t:;.,{}()=]*\\|\\([_$a-zA-Z][_$.a-zA-Z0-9]*\\)\\)\\s-*\\(([^);{}]*)\\)?\\([] \t]*\\)\\(\\s-*\\<throws\\>\\s-*\\(\\([_$a-zA-Z][_$.a-zA-Z0-9]*\\)[, \t\n\r\f\v]*\\)+\\)?\\s-*")

;;(easy-menu-define c-java-menu java-mode-map "Java Mode Commands"
;;		  (cons "Java" (c-lang-const c-mode-menu java)))

;;;###autoload (add-to-list 'auto-mode-alist '("\\.java\\'" . java-mode))

;;;###autoload
(defun java-mode ()
  "Major mode for editing Java code.
To submit a problem report, enter `\\[c-submit-bug-report]' from a
java-mode buffer.  This automatically sets up a mail buffer with
version information already added.  You just need to add a description
of the problem, including a reproducible test case, and send the
message.

To see what version of CC Mode you are running, enter `\\[c-version]'.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `java-mode-hook'.

Key bindings:
\\{java-mode-map}"
  (interactive)
  (kill-all-local-variables)
  (c-initialize-cc-mode t)
;;  (set-syntax-table java-mode-syntax-table)
  (setq major-mode 'java-mode
 	mode-name "Java"
 	local-abbrev-table java-mode-abbrev-table
	abbrev-mode t)
  (use-local-map java-mode-map)
  (c-init-language-vars-for 'java-mode)
  (c-common-init 'java-mode)
  (easy-menu-add c-java-menu)
  (cc-imenu-init cc-imenu-java-generic-expression)
  (c-run-mode-hooks 'c-mode-common-hook 'java-mode-hook)
  (c-update-modeline))