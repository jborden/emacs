;; Custom advice 
;; Author: James Borden
;; Created: 2012-09-24
;; Modified: 2012-09-24

;; From pg. 31 of Glickstein ( Giraffe Book)
;; This is used to keep from creating a new buffer "foo" when switching between "foo.c" and "foo.h"
;; Press C-u C-x b if you really want to create a new buffer "foo"
(defadvice switch-to-buffer (before existing-buffer
				    activate compile)
  "When interactive, swtich to existing buffers only, 
unless given a prefix argument."
  (interactive
   (list (read-buffer "Switch to buffer: "
		       (other-buffer)
		       (null current-prefix-arg)))))
