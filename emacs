
(package-initialize)

 (require 'package)
;; 					; add MELPA to repository list
 (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; 					; initialize package.el
;; 					; start auto-complete with emacs
 (require 'auto-complete)
;; 					; do default config for auto-complete
 (require 'auto-complete-config)

 (load-file "~/.emacs.d/linum+.el")
 (global-linum-mode 1)
 (global-hl-line-mode 1)
(load-theme 'monokai t)

(set-face-background 'hl-line "red4")  ;; Emacs 22 Only
;(set-face-background 'hl-line "#87005f")  ;; Emacs 22 Only

;; ;; To customize the background color


(cua-mode t)
;; after copy Ctrl+c in Linux X11, you can paste by `yank' in emacs
(setq x-select-enable-clipboard t)

;; ;; after mouse selection in X11, you can paste by `yank' in emacs
 (setq x-select-enable-primary t)
 (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


;; (tool-bar-mode -1)
 (put 'scroll-left 'disabled nil)

;;; set default font size for main buffer
 (set-face-attribute 'default nil :height 105)
; (set-background-color "#3a3a3a")

 (setq ispell-program-name "aspell"
 ispell-extra-args '("--sug-mode=ultra"))

 (global-auto-complete-mode t)






 (ac-config-default)

 ;start yasnippet with emacs
 (require 'yasnippet)
 (yas-global-mode 1)

 (electric-pair-mode 1)
 (show-paren-mode 1)
 (set-face-attribute 'region nil :background "#666")
 (set-face-italic 'font-lock-comment-face t)
 (set-face-foreground 'font-lock-comment-face "#ff5f00")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-prompt ((t (:background "black" :distant-foreground "red" :foreground "orange")))))


;; Auctex
(require 'package)
(package-initialize)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
 
(setq ac-math-unicode-in-math-p t)

;;;;whatever
(add-hook 'minibuffer-setup-hook
	  (lambda ()
	    (make-local-variable 'face-remapping-alist)
	    (add-to-list 'face-remapping-alist '(default (:background "red4")))))

(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

