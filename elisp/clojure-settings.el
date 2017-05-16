;; (add-hook 'clojure-mode-hook
;; 	  (lambda () add-to-list 'align-lisp-modes 'clojure-mode))

;; (append align-lisp-modes '(clojure-mode))

(add-hook 'align-load-hook (lambda ()
			     (add-to-list 'align-lisp-modes 'clojure-mode)))
