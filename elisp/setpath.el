;; from http://www.emacswiki.org/emacs/EmacsApp#toc3
;; (if (string-equal "darwin" (symbol-name system-type))
;;     (setenv "PATH" (concat "/Users/james/bash:/usr/local/bin:/usr/bin:/Users/james/:/bin:/usr/bin:/sbin:/Users/james/perl:/usr/X11/bin:/Users/james/bin:/usr/sbin/:/usr/local/mysql/bin:/Users/james/Library/Haskell/bin::/bin:/opt/local/bin:/opt/local/sbin::/usr/local/git/bin::/Users/james/.rvm/bin:/Users/james/src/QSTK/Bin/opt/local/bin:/opt/local/sbin:" (getenv "PATH"))))

;; the variable process-environment describes the path
(if (string-equal "darwin" (symbol-name system-type))
    (setenv "PATH" (concat "/Users/james/bin/Sencha/Cmd:/Users/james/src/apache-ant-1.9.4/bin:/Library/Java/JavaVirtualMachines/jdk1.7.0_71.jdk/Contents/Home/bin:/Users/james/.nix-profile/bin:/Users/james/.nix-profile/sbin:/opt/subversion/bin:/Users/james/bash:/usr/local/bin:/usr/bin:/Users/james/:/bin:/usr/bin:/sbin:/usr/local/texlive/2008/bin/universal-darwin:/Users/james/perl:/usr/X11/bin:/Users/james/bin:/usr/sbin/:/usr/local/mysql/bin:/Users/james/Library/Haskell/bin:/bin:/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/Users/james/src/QSTK/Bin:/Applications/apache-maven-3.3.3/bin:/Users/james/Software/ruby/bin")))

;; executable-find (sql-mysql) uses exec-path
(setq exec-path
      (quote
       ("/usr/bin"
	"/bin"
	"/usr/sbin"
	"/sbin"
	"/Users/james/src/emacs-24.1/nextstep/Emacs.app/Contents/MacOS/bin"
	"/Users/james/bin"
	"/usr/local/mysql/bin")))
