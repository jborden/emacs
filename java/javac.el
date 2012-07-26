;; Minor mode for compiling java classes
(defvar javac-mode nil
  "Mode variable for java class files.")
(make-variable-buffer-local 'javac-mode)

(defun javac-mode (&optional arg)
  "Minor mode for compiling java class files.
Special Commands:
\\{javac-mode-map}"
  (interactive "P")
  (setq javac-mode
	(if (null arg) (not javac-mode)
	  (> (prefix-numeric-value arg) 0)))
  ;; Set the minor mode alist to "javac" when the mode is active
  (if (not (assq 'javac-mode minor-mode-alist))
      (setq minor-mode-alist 
	    (cons '(javac-mode " javac") 
		  minor-mode-alist)) )
  ;; define a variable for the keymap
  (defvar javac-mode-map nil
    "Key map for javac minor mode.")
  ;;(setq javac-mode-map nil)
  ;; Load up the javac map
  ;;(if javac-mode-map ;; reminder: when adding new define-key, 
                     ;; be sure to clear javac-mode-map in order for 
                     ;; the new keys to take effect!
    ;;  nil ;; do nothing if javac-mode-map exists
  
  ;; erase any currently defined javac-mode-map
  (setq javac-mode-map nil)
  (setq javac-mode-map (make-sparse-keymap))                ;; create the map
  (define-key javac-mode-map "\C-cc" 'javac-compile-class)        ;; compile java into .class file
  (define-key javac-mode-map "\C-cd" 'javac-add-dir-to-javac-classpath) ;; add a dir to the classpath
  (define-key javac-mode-map "\C-cj" 'javac-run-java)             ;; run java on a class

  (use-local-map javac-mode-map) ;; load up the keymap

  (defvar javac-command nil
    "String used as argument to shell-command for compiling java")
  ;; classpath 
  (defvar javac-classpath "."
    "String used to store the javac-classpath")
  
  (defun javac-compile-class ()
    "Compile a .java file into a .class file"
    (interactive)
    (setq javac-command (concat "javac -cp " javac-classpath " " buffer-file-name)) ;; compile the file associated with the local buffer
    (shell-command javac-command)
    ;; end of javac-compile-class
    )
(defun javac-run-java ()
  "Run the command line java on a .java file as a class with the curent javac-classpath"
  (interactive)
  (setq class-name (split-string buffer-file-name "\\/" ))          ;; split up the filename to remove dir information
  (setq class-name (split-string (car (last class-name)) "\\."))    ;; using the last element of class-name, split by .
                                                                    ;; car gets the first element of the list and returns the string
  (setq class-name (pop class-name))                                ;; finally, get the name of the class
  (setq javac-command (concat "java -cp " javac-classpath " " class-name)) ;; create the java command for the buffer
  
  (shell-command javac-command)                                     ;; run the command
)
(defun javac-add-dir-to-javac-classpath ()
  
  "Add a directory to the current javac-classpath.
  This variable will be saved for future emacs sessions."
  (interactive)
  (defvar temp-dir nil
    "Temporary variable for storing a new javac-classpath dir.")
  (setq temp-dir 
	(read-directory-name "Dir to add to javac-classpath: "))
  (list temp-dir)
  (setq javac-classpath (concat javac-classpath ":" (expand-file-name temp-dir)))
  ;; save the javac-classpath between sessions
  (customize-save-variable 'javac-classpath javac-classpath)
  ;; end of javac-add-dir-to-javac-classpath
  )

;; end of javac-mode
)
