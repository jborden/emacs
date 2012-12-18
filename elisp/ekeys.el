;; Default encoding using UTF-8
(set-language-environment "utf-8")
;; set C-w for backword kill
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;; set M-x to C-x C-m to
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;; Set C-l to goto-line
(global-set-key "\C-l" 'goto-line)
;; Set C-x C
(global-set-key "\C-x p" 'other-window-backward)
;; Scroll forward with C-f
(global-set-key "\C-f" 'scroll-up-command)
;; Scroll backward with C-b
(global-set-key "\C-b" 'scroll-down-command)
