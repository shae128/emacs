
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

(package-initialize)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   (quote
    ("e03d2efd989b91f29ed5f91f160b0054031e6b6574950f7d64792a3acf0c9565" "ef0d2cd0b5ecebd6794a2012ffa08393e536b33e3e377ac2930bf5d7304dcb21" "83faf27892c7119f6016e3609f346d3dae3516dede8fd8a5940373d98f615b4e" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files
   (quote
    ("~/.org/pythonCert.org" "~/.org/gtd.org" "~/.org/first.org")))
 '(package-selected-packages
   (quote
    (htmlize windresize elpy jedi magit flycheck evil yasnippet-snippets helm php-auto-yasnippets yasnippet sqlup-mode php-mode emmet-mode auto-complete dracula-theme labburn-theme foggy-night-theme ## zenburn-theme highlight-indent-guides w3 org org-plus-contrib)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
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
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; latex config
(require 'ox-latex)
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)
(setq org-export-latex 'minted)
(setq org-src-fontify-natively t)

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; stop asking confirmation for code eveluation
(setq org-confirm-babel-evaluate nil)

;; enable flyspell in org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(define-key global-map "\C-o" 'flyspell-auto-correct-previous-word)

;; to enable time stamp for TODO
(setq org-log-done t)

;; Change M-RET behaviour
(setq org-M-RET-may-split-line nil)

;; to enable note for TODO
;; (setq org-log-done 'note)

;; Enable indention
(setq org-startup-indented t)

;; enable tab on evil mode
(setq evil-want-C-i-jump nil)

;; define org-mode Capture default file
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; define capture global key-map
(define-key global-map "\C-cc" 'org-capture)

;; defin todo and daily  template
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.org/gtd.org" "Tasks")
	 "* TODO %?\n %i\n  %a")
	("j" "Journal" entry (file+datetree "~/.org/journal.org")
	 "* %?\nEntered on %U\n %i\n %a")))

;; Set to the location of your Org files on your local system
(setq org-directory "~/.org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/.org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")


;; define default agenda files
;; (setq org-agenda-files (list "~/.org/gtd.org"
;; 			     "~/.org/journal.org"
;; 			     "~/.org/first.org"))

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ox-latex)
;; ;(add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-listings 'minted)

;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; (require 'ox-latex)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-listings 'minted)

;; (setq org-latex-pdf-process
;;       '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;         "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; (setq org-src-fontify-natively t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;YASnippets;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(yas-global-mode 1)
(global-set-key (kbd "C-x y") 'yas/create-php-snippet)

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

;; change mode-line color by evil state
   (lexical-let ((default-color (cons (face-background 'mode-line)
                                      (face-foreground 'mode-line))))
     (add-hook 'post-command-hook
       (lambda ()
         (let ((color (cond ((minibufferp) default-color)
                            ((evil-insert-state-p) '("#009688" . "#ffffff"))
                            ((evil-emacs-state-p)  '("#262626" . "#86ae86"))
                            ((buffer-modified-p)   '("#1771b9" . "#ffffff"))
                            (t default-color))))
           (set-face-background 'mode-line (car color))
           (set-face-foreground 'mode-line (cdr color))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Jedi Python mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Elpy Python mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(elpy-enable)
(setq python-shell-completion-native-enable nil)
;;(setq elpy-modules nil)
;;(setq python-python-command "/usr/local/Cellar/python/3.7.0/bin/python3")
;;change emacs python version
(setq python-shell-interpreter "/usr/local/Cellar/python/3.7.0/bin/python3")
(setq elpy-rpc-python-command "python3")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Flycheck mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-flycheck-mode 1)
(add-hook 'after-init-hook #'global-flycheck-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;magit mode;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x g") 'magit-status)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Wind Move;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))
(define-key input-decode-map "\e[1;2A" [S-up])
(windmove-default-keybindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;SQL;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Capitalize keywords in SQL mode
(add-hook 'sql-mode-hook 'sqlup-mode)
;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;INTERFACE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable Line Number
(global-linum-mode 1)

;; Enable Mouse
(xterm-mouse-mode 1)

;; Add Space after numbers
(setq linum-format "%d ")

;; Add Line and space after numbers
;;(setq linum-format "%4d \u2502 ")

;; Enable foggy-night them
;; (load-theme 'foggy-night t)

;;Enable line Highlights
(global-hl-line-mode 1)

;;;;;Remap Split resize;;;;;;;;;;;;;
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)

;; (global-set-key (kbd "<C-up>") nil)
;; (global-set-key (kbd "<C-up>") 'shrink-window)
;; (global-set-key (kbd "<C-down>") nil)
;; (global-set-key (kbd "<C-down>") 'enlarge-window)


;;;;; ZENBUR Area ;;;;;;;;;;;;;
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; use variable-pitch fonts for some headings and titles
(setq zenburn-use-variable-pitch t)

;; scale headings in org-mode
(setq zenburn-scale-org-headlines t)

;; scale headings in outline-mode
(setq zenburn-scale-outline-headlines t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;;; init.el ends here
