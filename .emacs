;;remove the startup screen
(setq inhibit-startup-screen t)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;PACKAGE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;;auto complete package
(use-package auto-complete
	     :ensure t
	     :init
	     (progn
	       (ac-config-default)
	       (global-auto-complete-mode t)
	       ))
;;mark down
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;racket support
(use-package racket-mode
  :ensure t)

(use-package auctex
  :defer t
  :ensure t
  :config
  (setq TeX-auto-save t))


;SYSTEM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;theme
(load-theme 'tango)
;;set bell sound off
(setq ring-bell-function 'ignore) 

;;backup to a specific directory instead of the same folder
(setq backup-directory-alist `((".a" . "~/.Emacsaves/")))

;;find file by name with wildcard
(global-set-key (kbd "C-c f") 'find-name-dired)
;;use DEL to delete in text search C-s
(define-key isearch-mode-map (kbd "DEL") 'isearch-del-char)

;MODE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;ido mode for suggestions
(ido-mode t)(setq ido-everywhere t)

;;specific minor in major mode

;;enable auto paren globally
(electric-pair-mode 1)
;;paren highlight
(show-paren-mode 1)
;;auto-wrap (no line) visually
(global-visual-line-mode 1)

;;spellcheck in text mode, need ispell/aspell installed in OS
(add-hook 'text-mode-hook 'flyspell-mode)


(org-babel-load-file (expand-file-name "~/.emacs.d/orgInit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(auctex org-bullets use-package racket-mode markdown-mode auto-complete)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
