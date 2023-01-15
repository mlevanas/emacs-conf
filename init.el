(setq inhibit-startup-screen t)	
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(base16-default-dark))
 '(custom-safe-themes
   '("cfce7968302b78671dca1e940b5d5f38f997df79c85b16dc2886e7b735f00798" "e163df1666003c3c140c4293ca2432837b94dbcbee68a1377e648520808b5b16" "c549efd8b482bb1c7e32d14b00f6197bf4cf3adb94dee42f0e7760994407bb3e" "f0f5bfda176875f70299b2a3a07e778f23b8af81defe3bc40babd0a85f88d411" default))
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(package-selected-packages
   '(demap company-php company php-mode web-mode base16-theme base16-monikai base16-monikai-theme powerline-evil powerline-themes powerline tron-legacy-theme use-package babel smex evil ##)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "#00aaff")))))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tab-bar-mode -1)

(use-package evil
  :ensure t)
(evil-mode t)

(use-package base16-theme
 :ensure t
 :config (load-theme 'base16-default-dark t)
)

(use-package web-mode
  :ensure t)

(use-package powerline
  :ensure t)
(powerline-default-theme)

(use-package smex
  :ensure t)
(global-set-key (kbd "M-x") 'smex)

(use-package php-mode
  :ensure t)

(use-package company
  :ensure t)
(global-company-mode t)

(use-package company-php
  :ensure t)

;; dired configuragtion
;; do not open other buffer on directory navigation
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-listing-switches "-aghol --group-directories-first")

;; store backups in backup directory in emacs file
(make-directory (expand-file-name "backups/" user-emacs-directory) t)
(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

(global-hl-line-mode)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; webjump configuration
(require 'webjump)
;; add qwant to the list
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
		'("Qwant" .
		  [simple-query "https://qwant.com"
					"https://qwant.com/?q="
					""])))
(put 'downcase-region 'disabled nil)
