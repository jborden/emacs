;; customizations for cider
(defun selenium-clj-reset ()
  (when (string= (buffer-name) "selenium.clj")
    (cider-interactive-eval
     "(reset-vars!)")))

(add-hook 'cider-mode-hook
	  (lambda ()
	    (add-hook 'cider-file-loaded-hook 'selenium-clj-reset)))
