;; Load up mic-paren, a tool for better parenthesis
;; highlighting than default emacs. 
(require 'mic-paren) ; load up the utility
(paren-activate)     ; turn it on

;; From 'Writing GNU Emacs Extensions' by Bob Glickstein
;; A function to switch to "previous window" (opposite of C-O)
(defun other-window-backward (&optional n) ;; &optional means all subsequent parameters are optional
"Select Nth previous window." 
;;(interactive "p") ;; code letter p means: if there is a prefix argument, interpret it as a number, and if there is no prefix argument, interpret that as the number 1."
;; Step 2
;; (if n
;;    (other-window (- n)) ;; negate n. (- n), (- 5 2) yields 3, but (- 5) yields -5
;;  (other-window -1))) ;; n is nil
;;
;; Step 3
;; above if statement is condensed to
;; (other-window (if n (- n) -1)))
;; Step 4 
;; or statement is used
;;(other-window ( - (or n 1)))) ; or evaluates until it finds a non-nil answer, than returns that
                                 ; value
;; Step 5 "most Emacs-Lisp-like"
(interactive "P") ;; P means: when called interactively, leave the prefix argument in raw form and assign it to n. The raw form of a prefix argument is a data structure used internally by Emacs to record the prefix information the user gave before invoking a command.
(other-window (- (prefix-numberic-value n)))) 
;; Return numeric meaning of raw prefix argument RAW.
;; A raw prefix argument is what you get from `(interactive "P")'.
;;Its numeric meaning is what you would get from `(interactive "p")'.

;; sort-symbols from http://www.emacswiki.org/emacs/SortWords
(defun sort-symbols (reverse beg end)
      "Sort symbols in region alphabetically, in REVERSE if negative.
    See `sort-words'."
      (interactive "*P\nr")
      (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))


