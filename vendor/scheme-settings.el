;; make the default scheme chicken scheme
(setq scheme-program-name "/usr/local/bin/csi")
;; use smart completion
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))
;; run eldoc mode when scheme mode is on
(eval-after-load 'scheme
    '(eldoc-mode 1))

(eval-after-load 'scheme
  '(define-key scheme-mode-map "\t" 'scheme-complete-or-indent))

(eval-after-load 'cmuscheme
  '(define-key inferior-scheme-mode-map "\t" 'scheme-complete-or-indent))

(eval-after-load 'cmuscheme
  '(eldoc-mode 1))

(autoload 'scheme-get-current-symbol-info "scheme-complete" nil t)
(add-hook 'scheme-mode-hook
  (lambda ()
    (make-local-variable 'eldoc-documentation-function)
    (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
    (eldoc-mode)))

