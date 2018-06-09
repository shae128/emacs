;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("83faf27892c7119f6016e3609f346d3dae3516dede8fd8a5940373d98f615b4e" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" default)))
 '(package-selected-packages
   (quote
    (flycheck evil yasnippet-snippets helm php-auto-yasnippets yasnippet sqlup-mode php-mode emmet-mode auto-complete dracula-theme labburn-theme foggy-night-theme ## zenburn-theme highlight-indent-guides w3 org org-plus-contrib))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;To add MELPA
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Functionality;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
( global-auto-complete-mode t )
(ac-config-default) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ORG Mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;YASnippets;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(yas-global-mode 1) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Helm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Emmet Mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'emmet-mode)

;; ;; enable Emmet's css abbreviation
(add-hook 'css-mode-hook  'emmet-mode) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Evil mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; use Emacs keybindings when in insert 
(require 'evil)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Flycheck mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-flycheck-mode 1)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INTERFACE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable Line Number
(global-linum-mode 1)

;; Add Space after numbers
(setq linum-format "%d ")

;; Add Line and space after numbers
;;(setq linum-format "%4d \u2502 ")

;;Enable foggy-night them
(load-theme 'foggy-night t)

;;Enable line Highlights
(global-hl-line-mode 1)

;; Enable and Configuration of highlight-indent-guides
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'text-mode-hook 'highlight-indent-guides-mode)

(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-auto-enabled nil)

(set-face-background 'highlight-indent-guides-odd-face "darkgray")
(set-face-background 'highlight-indent-guides-even-face "dimgray")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")

;;(setq highlight-indent-guides-auto-enabled )
;;(setq highlight-indent-guides-auto-odd-face-perc 15)
;;(setq highlight-indent-guides-auto-even-face-perc 15)
;;(setq highlight-indent-guides-auto-character-face-perc 20)


;;SQL
;; Capitalize keywords in SQL mode
(add-hook 'sql-mode-hook 'sqlup-mode)
;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)
