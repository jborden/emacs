;; James Borden's
;; Personal settings for flymake
;; Flymake for php
(require 'flymake)
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
;; important: needed to load flymake with the mode
(add-hook 'find-file-hook 'flymake-mode)

;; For Javascript flymake
;; this is using a v8-compiled jslint
;; see http://koansys.com/tech/flymake-mode-for-emacs-javascript-v8-edition
;;(require 'flymake-jslint)
;;(add-hook 'javascript-mode-hook
;;	  (lambda () (flymake-mode 1)))

;; clears out a hook
(setq javascript-mode-hook nil)
;; Turn off java flymake, for now
(delete '("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup) flymake-allowed-file-name-masks)
;; customize what files flymake is allowed to handle
(setq flymake-allowed-file-name-masks 
      '(("\\.php[345]?\\'" flymake-php-init) ; for now, only php will have flymake run for it
	))
