;; Packages
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(setq package-selected-packages (quote(
	dotenv-mode
	dracula-theme
	web-mode
	editorconfig
	json-mode
	nginx-mode
	org
)))

(package-install-selected-packages)

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Save point position between sessions
(save-place-mode t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Mini-buffer auto-complete
(ido-mode t)

;; Highlight matching braces
(setq show-paren-delay 0)
(show-paren-mode t)

;; Highlight current line
(global-hl-line-mode t)

;; Theme
(load-theme 'dracula t)

;; Font
(add-to-list 'default-frame-alist '(font . "Fira Code-14"))

;; Line Number
(global-display-line-numbers-mode t)

;; Show cursor column number
(column-number-mode t)

;; Auto refresh buffers
(global-auto-revert-mode t)

;; FlyMake
;(require 'flymake)

;; WebMode
;(require 'web-mode)
;(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))

;; .env mode
(require 'dotenv-mode)
(add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)) ;; for optionally supporting additional file extensions such as `.env.test' with this major mode
