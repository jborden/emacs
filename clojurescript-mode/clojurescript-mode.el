
;;; clojurescript-mode.el --- Major mode for ClojureScript code

;; Copyright (C) 2011 Luke Amdor, 2012 Andrew Mains, 2013 James Borden
;;
;; Authors: Luke Amdor <luke.amdor@gmail.com>, Andrew Mains <amains12@gmail.com>, James Borden <jmborden@gmail.com>
;; URL: http://github.com/rubbish/clojurescript-mode
;; Version: 0.2
;; Keywords: languages, lisp, javascript

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Provides an REPL to the
;; ClojureScript language. (http://github.com/clojure/clojurescript) using
;; lein cljsbuild.

;; For information on how to start up the REPL correctly see
;; https://github.com/clojure/clojurescript/tree/master/samples/repl
;; and
;; https://github.com/clojure/clojurescript/wiki/The-REPL-and-Evaluation-Environments

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

(require 'clojure-mode)
(require 'subshell-proc)

(defcustom clojurescript-repl-type "repl-listen"
  (concat "Which ClojureScript REPL type to use. \n"
          "Valid options are: \"repl-rhino\", \"repl-listen\" and \"repl-launch <command identifier>\".\n"
          "See lein help cljsbuild for details"
  ))

(defvar clojurescript-repl-buffer-name "*cljs*"
  "TODO"
)

(defun cljs-repl-command () 
  ;; (concat "lein2 trampoline cljsbuild " 
  ;;       clojurescript-repl-type))
  ;; (concat "lein21 trampoline run -m clojure.main src/hello_world/node_repl.clj")
  (concat "lein25 trampoline cljsbuild repl-listen")
  )


(defun setup-inf-lisp-buffer ()  
  (make-local-variable 'inferior-lisp-buffer)
  (setq inferior-lisp-buffer clojurescript-repl-buffer-name))

(defun inferior-cljs (cmd &optional buffer-name)
  (interactive (list (if current-prefix-arg
                          (read-string "Run lisp: " inferior-lisp-program)
                              inferior-lisp-program)))
  (let ((buffer-name (or buffer-name clojurescript-repl-buffer-name)))
    (if (not (comint-check-proc buffer-name))
        (run-proc cmd buffer-name)
      (inferior-lisp-mode))
    (pop-to-buffer buffer-name)))

(defun de-star (buffer-name)
  (if (string-match "^\\*[^*]*\\*$" buffer-name)
      (substring buffer-name 1 (- (length buffer-name) 1))
    buffer-name))

(defun clojurescript-switch-to-lisp ()
  (interactive)
  (unless (get-buffer-process clojurescript-repl-buffer-name)    
    (inferior-cljs (cljs-repl-command)))
  (pop-to-buffer clojurescript-repl-buffer-name))

;; cljs-defun-at-point and cljs-region-for-defun-at-point 
;; are from slime, but renamed so as to be independent of slime
 (defun cljs-defun-at-point ()
   "Return the text of the defun at point."
   (apply #'buffer-substring-no-properties
          (cljs-region-for-defun-at-point)))

 (defun cljs-region-for-defun-at-point ()
   "Return the start and end position of defun at point."
   (save-excursion
     (save-match-data
       (end-of-defun)
       (let ((end (point)))
         (beginning-of-defun)
         (list (point) end)))))

;; todo: run command in ns without changing ns of *cljs*
(defun clojurescript-compile-defun ()
  (interactive)
  (let* ((cljs-defun (cljs-defun-at-point))
	 (cljs-namespace-command (concat "(in-ns '" (clojure-find-ns) ")"))
	 (cljs-command (concat cljs-namespace-command " " cljs-defun)))
    (comint-send-string (get-buffer-process clojurescript-repl-buffer-name) (concat cljs-command "\n"))))

;; TODO: make this function more generic by defining a project dir
;; relative to the buffer's filename
(defun compile-tags ()
  "compile etags for the current project"
  (interactive)
  (let* (
	 ;; file-name-as-directory will always print a dir with leading slash
	 (cljs-project  (expand-file-name (read-directory-name "project dir: ")))
	 ;;(regex-file (concat cljs-project "reg-ex.etag"))
	 (regex-pattern1 "'/[ \\t\\(]*def[a-z]* \\([a-z-!]+\\)/\\1/'") ; any kind of def*
	 (regex-pattern2 "'/[ \t\(]*ns \([a-z.]+\)/\1/'")              ; namespace
	 (tags-file  (concat cljs-project "TAGS"))
	 (etags-command (concat "find " cljs-project " -name '*.cljs' | xargs etags --regex=" regex-pattern1 " --regex=" regex-pattern2 " -o " cljs-project "TAGS")))
    (shell-command etags-command)
    ;(print etags-command)
    ))


(defun define-keys ()
  (setq clojurescript-mode-map (make-sparse-keymap))
  (use-local-map clojurescript-mode-map)
  (define-key clojurescript-mode-map (kbd "C-c C-z") 'clojurescript-switch-to-lisp)
  (define-key clojurescript-mode-map (kbd "C-c C-t") 'compile-tags)
  (define-key clojurescript-mode-map (kbd "C-c C-c") 'clojurescript-compile-defun)
  (define-key clojurescript-mode-map (kbd "M-.") 'find-tag))
  ;; remap is the slime-compile-defun to my own clojurescript-compile-defun
  ;; see http://www.gnu.org/software/emacs/manual/html_node/elisp/Remapping-Commands.html
  ;; for more info
  ;;(define-key clojurescript-mode-map [remap slime-compile-defun] 'clojurescript-compile-defun)
  ;;(define-key clojurescript-mode-map [remap slime-edit-definition] 'find-tag))

;;;###autoload
(define-derived-mode clojurescript-mode clojure-mode "ClojureScript"
  "Major mode for ClojureScript"
  (setup-inf-lisp-buffer)
  (define-keys)
  (add-hook 'inferior-lisp-mode-hook 'inf-lisp-mode-hook nil 't)
  (add-hook 'clojurescript-mode-hook 'cljs-disable-slime)
  ;; turn off slime mode, which is in 'clojure-mode-hook
  (make-local-variable 'inferior-lisp-program)
  (setq inferior-lisp-program (cljs-repl-command)))
;; slime is no longer needed and re-binds keys that interfere with my setup
;; (when (functionp 'slime-mode)
;;   (slime-mode -1))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(provide 'clojurescript-mode)

;;Hooks

(defun inf-lisp-mode-hook ()
  (let ((cur-buf (current-buffer)))
    (cond ((and (get-buffer clojurescript-repl-buffer-name)
             (not (get-buffer-process clojurescript-repl-buffer-name)))
           (kill-buffer clojurescript-repl-buffer-name)
           (with-current-buffer cur-buf
             (rename-buffer clojurescript-repl-buffer-name)))
          ((not (get-buffer clojurescript-repl-buffer-name))
           (with-current-buffer cur-buf
             (rename-buffer clojurescript-repl-buffer-name)))
          ('t  ;else
           (let ((inf-lisp-proc (get-buffer-process cur-buf)))
             (set-process-buffer inf-lisp-proc nil)
             (kill-process inf-lisp-proc)
             (kill-buffer cur-buf))))))

(defun cljs-disable-slime ()
  (if (and (boundp 'slime-mode) slime-mode)
      (slime-mode -1)))
 
  ;;     (if (not (get-buffer clojurescript-repl-buffer-name))
          
  ;;                                       ;Else, repl buffer already exists and is active; use it
  ;;       ))
  ;; ))


;;If it exists and doesn't have a process -- kill it and rename current
;;If it exists and has a process -- use it
;;If it doesn't exist -- rename current
          

;;; clojurescript-mode.el ends here

