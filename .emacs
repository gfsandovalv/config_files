(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


					; start package.el with emacs
(require 'package)
					; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
					; initialize package.el
(package-initialize)
					; start auto-complete with emacs
(require 'auto-complete)
					; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

					; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/6")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/6")
  (add-to-list 'achead:include-directories '"/usr/include/c++/6/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/6/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/6/include-fixed")
  (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include/"))
					; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


(electric-pair-mode 1)
(global-linum-mode 1)

(setq linum-format 'smart)
;(setq linum-format "%4d \u2502 ")

(load-file "~/.emacs.d/linumplus.el")

