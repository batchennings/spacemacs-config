;; (setq debug-on-error t)

(add-to-list 'load-path "~/.emacs.d/plugins/") ;; on signale à emacs l'emplacement des plugins
(setq-default flycheck-emacs-lisp-load-path 'inherit)

(setq user-full-name "thomas guesnon")
(setq user-mail-address "bonjour@thomasguesnon.fr")

;; default path for file creation
(setq default-directory "~/Documents/")
(setq org-directory "~/Dropbox/org/")

;; Don't use messages that you don't read
;; (setq initial-scratch-message "") ;; rien sur l'écran
(setq inhibit-startup-message t)

;; (setq pjn-bg-color "#eeddaa")

 (load-file "~/.emacs.d/plugins/lorem-ipsum.el") 

;; mon propre écran de démarrage
;; (add-hook 'emacs-startup-hook
;; 	  (lambda ()
;; 	    (fancy-splash-insert
;; 	     :face 'variable-pitch
;; 	     (concat "Salut… Aujourd'hui, " (format-time-string "%A %d %b %Y"))
;; 	     "\n\n"
;; 	     "Commandes"
;; 	     "\n\n"
;; 	     "     * [mu] "
;; 	     :link `("Mails (mu4e)"
;; 		     ,(lambda (_button) (call-interactively 'mu4e))
;; 		     "Lire les mails")
;; 	     "\n"
;; 	     "     * [de] "
;; 	     :link `("Deft files"
;; 		     ,(lambda (_button) (deft))
;; 		     "")
;; 	     "\n"
;; 	     "     * [ag] "
;; 	     :link `("Agenda"
;; 		     ,(lambda (_button) (execute-kbd-macro (read-kbd-macro "C-c a n")))
;; 		     "")
;; 	     "\n\n\n"
;; 	     "Fichiers"
;; 	     "\n\n"
;; 	     "     * [dh] "
;; 	     :link `("Home"
;; 		     ,(lambda (_button) (dired "~"))
;; 		     "")
;; 	     "\n"
;; 	     "     * [dw] "
;; 	     :link `("Work"
;; 		     ,(lambda (_button) (dired "~/Documents/work"))
;; 		     "")
;; 	     "\n"
;; 	     "     * [db] "
;; 	     :link `("Bureau"
;; 		     ,(lambda (_button) (dired "~/Bureau"))
;; 		     "")
;; 	     "\n\n\n"
;; 	     ))
;; 	  ((lambda ()
;; 	     (interactive)
;; 	     (define-key lisp-interaction-mode-map "mu"
;; 	       (lambda () (interactive) (call-interactively 'mu4e)))
;; 	     (define-key lisp-interaction-mode-map "de"
;; 	       (lambda () (interactive) (deft)))
;; 	     (define-key lisp-interaction-mode-map "ag"
;; 	       (lambda () (interactive) (execute-kbd-macro (read-kbd-macro "C-c a n"))))
;; 	     (define-key lisp-interaction-mode-map "dh"
;; 	       (lambda () (interactive) (dired "~")))
;; 	     (define-key lisp-interaction-mode-map "dw"
;; 	       (lambda () (interactive) (dired "~/Documents/work")))
;; 	     (define-key lisp-interaction-mode-map "db"
;; 	       (lambda () (interactive) (dired "~/Bureau")))
;; 	     )))


;; (setq initial-major-mode 'org-mode) ;; le premier buffer est en mode markdown
;; (setq initial-buffer-choice "/home/patjennings/.emacs.d/init.el") ;; quel est le premier buffer ?
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(set-face-font 'default "JetBrains Mono 11")
(set-face-font 'variable-pitch "JetBrains Mono 11")

;; (setq gnus-article-wash-html t)

(add-to-list 'default-frame-alist '(font . "JetBrains Mono 11" ))
(set-face-attribute 'default t :font "JetBrains Mono 11" )
;; delete/replace selected text (plutôt que de le placer après, ce qui me fait enrager)
(setq dired-hide-details-mode t)

(delete-selection-mode 1)

;; (require 'json-reformat)
(show-paren-mode 1)
;; (wrap-region-mode t)

;; (desktop-save-mode 1)

;; when a file is updated outside emacs, make it update if it's already opened in emacs
(global-auto-revert-mode 1)

(require 'calfw-org)

;; --------
;; PACKAGES
;; --------

;; packages repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; quelpa
;; (package-initialize)
;; (unless (require 'quelpa nil t)
  ;; (with-temp-buffer
    ;; (url-insert-file-contents "https://github.com/quelpa/quelpa/raw/master/bootstrap.el")
    ;; (eval-buffer)))


;; ----------------
;; CUSTOM VARIABLES
;; ----------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   '("ed5c37f3c823f0b4348e5025707ac40b95dbecd99a67d93cd4416c258eaf75f0" "966a49d899d00211fa2fa652b5f64e106782cd84b30dff4c658eb5d542fce5a1" "7f666327ab76c4cf1bd60d55e2fd17e46ebf44c10df466adc86312089bb3fdfe" "ae30c27916f58eb24285b19d52e2c4ae36b862a3856bbbc5e932f5d436dc7d61" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "77113617a0642d74767295c4408e17da3bfd9aa80aaa2b4eeb34680f6172d71a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62
fb50b6d00e8b01c2208e55543a6337433a" default))
 '(doc-view-continuous t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(helm-completion-style 'emacs)
 '(org-agenda-custom-commands
   '(("x" "Tags dans links/docs/notes-pro/wishlist" tags ""
      ((org-agenda-files
	`(,(concat org-directory "notes_docs.org")
	  ,(concat org-directory "notes_links.org")
	  ,(concat org-directory "notes_pro.org")
	  ,(concat org-directory "notes_perso.org")
	  ,(concat org-directory "notes_wishlist.org")))))
     ("n" "Agenda / INTR / PROG / NEXT"
      ((agenda "" nil)
       (todo "INTR" nil)
       (todo "PROG" nil)
       (todo "NEXT" nil))
      nil)))
 '(org-agenda-files
   `(,(concat org-directory "travail.org")
     ,(concat org-directory "perso.org")
     ,(concat org-directory "administratif.org")
     ,(concat org-directory "cal/thomas-cal.org")
     ,(concat org-directory "cal/thomas-free-cal.org")
     ,(concat org-directory "cal/clemence-cal.org")))
 '(org-agenda-search-view-max-outline-level 1)
 '(org-agenda-text-search-extra-files
   `(,(concat org-directory "archive/archive.org")
     ,(concat org-directory "notes_docs.org")
     ,(concat org-directory "notes_famille.org")
     ,(concat org-directory "notes_reference.org")
     ,(concat org-directory "notes_inbox.org")
     ,(concat org-directory "notes_links.org")
     ,(concat org-directory "notes_pro.org")
     ,(concat org-directory "notes_perso.org")
     ,(concat org-directory "notes_wishlist.org")))
 '(org-export-with-sub-superscripts nil)
 '(org-id-extra-files t)
 '(org-id-track-globally t)
 '(package-selected-packages
   '(htmlize typit wttrin quelpa-use-package quelpa org-ql ivy monkeytype magit chronos chess mu4e-alert evil doom-themes color-theme-sanityinc-tomorrow soothe-theme deft org-journal yaml-mode yasnippet-snippets wrap-region web-mode visual-regexp use-package rjsx-mode processing-mode pomidor php-mode org-vcard org-plus-contrib org-agenda-property markdown-mode less-css-mode helm-swoop helm-c-yasnippet emms auto-complete))
 '(speedbar-show-unknown-files t)
 '(window-divider-mode nil))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(fringe ((t (:background "pjn-bg-color")))))


;; text color
(progn
  (progn
    (face-spec-set 'org-level-1 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#FA101E"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#ff649a"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-level-2 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#FA149E"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#6f82ff"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-level-3 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#7916F6"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#90e1ff"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-level-4 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#059FA9"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#82ffc6"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-level-5 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#37B65A"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#a9ff82"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-level-6 ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#A7970C"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#ced83f"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-todo ;; originally copied from org-level-8
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#025B06"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#025B06"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    (face-spec-set 'org-headline-done
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#b9bbbe"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#4a4a08"))
		       (((class color) (min-colors 8)) (:foreground "green")))))

        (face-spec-set 'region
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:foreground "#ffffff"))
		       (((class color) (min-colors 16) (background dark)) (:foreground "#ffffff"))
		       (((class color) (min-colors 8)) (:foreground "ffffff")))))
    (face-spec-set 'hl-line
		   (org-compatible-face nil ;; not inheriting from outline-9 because that does not exist
		     '((((class color) (min-colors 16) (background light)) (:background "#ffff84"))
		       (((class color) (min-colors 16) (background dark)) (:background "#3a3a06"))
		       (((class color) (min-colors 8)) (:foreground "green")))))
    ;; (setq org-level-faces (append org-level-faces (list 'org-level-9)))
    (setq org-n-level-faces (length org-level-faces))))


;; ---------------
;; PANDOC/MARKDOWN
;; ---------------
(setq markdown-command "/usr/bin/pandoc")
(setq markdown-xhtml-header-content "<meta http-equiv='Content-Type' content='text/html' charset='utf-8' /><link rel='stylesheet' media='all' href='/var/www/html/Jypi/public/css/all.css'><style type='text/css'>body{padding: 32px;}</style>"   ) ;; on ajoute l'encodage et la feuille de style, pour que ce soille bô !

;; -----------------
;; ARDUINO MODE
;; -----------------
(add-to-list 'load-path "~/.emacs.d/plugins/arduino-mode")
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; ---------------
;; EMACS TRR
;; ---------------
(add-to-list 'load-path "~/.emacs.d/plugins/emacs-trr")
(require 'trr)

;; -------------
;; YAML
;; -------------
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))0

;; -------------
;; BOOKMARKS
;; -------------
(setq bookmark-default-file "~/.emacs.d/bookmarks") ;; fichier accuillant les bookmarks


;; ------------
;; PRINTING
;; ------------
;; 2 column landscape size 7 prints column 0-78, lines 1 to 70
(setq ps-paper-type 'a4
      ps-font-size 9.0
      ps-print-header nil
      ps-number-of-columns 1)

;; -------------
;; CODE SNIPPETS
;; -------------
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; Autocomplete
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

;; --------
;; ELECTRIC PAIR
;; --------
;; Auto-close parenthesis, bracket, curly-brackets, etc. related to current major-mode
(electric-pair-mode t)

;; visual-line-mode activé pour les fichiers markdown
;; texte-en drapeau, et non coupé au caractère i.e. plus lisible

(add-hook 'markdown-mode-hook (lambda ()
				(visual-line-mode t)))

(add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)))

;; --------
;; ORG-MODE
;; --------
(use-package org
  ;; Install package org-plus-contrib for org
  :ensure org-plus-contrib
  ;; Install from 'org' package archive
  :pin org
  ;; Load org in org-mode
  :mode (("\\.org$" . org-mode))
  ;; Bind keys
  :bind (("C-c c" . org-capture)
  	 ("C-c l" . org-store-link)
  	 ("C-c a" . org-agenda))
  ;; Configure org
  :config (progn

	    ;; org and mu4e
	    ;;store org-mode links to messages
	    ;; (require 'org-mu4e)
	    ;; ;;store link to message if in header view, not to header query
	    ;; (setq org-mu4e-link-query-in-headers-mode nil)

	    ;; org refile mechanism
	    (setq org-refile-targets `((,(concat org-directory "notes_docs.org") :maxlevel . 9)
				       (,(concat org-directory "notes_ecrire.org") :maxlevel . 9)
				       (,(concat org-directory "notes_famille.org") :maxlevel . 9)
				       (,(concat org-directory "notes_reference.org") :maxlevel . 9)
				       (,(concat org-directory "notes_links.org") :maxlevel . 9)
				       (,(concat org-directory "notes_pro.org") :maxlevel . 9)
				       (,(concat org-directory "notes_perso.org") :maxlevel . 9)
				       (,(concat org-directory "gestion.org") :maxlevel . 9)
				       (,(concat org-directory "notes_son.org") :maxlevel . 9)
                                       (org-agenda-files :maxlevel . 9)))
	    (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
	    ;; (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

	    (setq org-refile-use-outline-path 'file)
	    ;; (setq org-refile-targets '((org-agenda-files :level . 1)))
	    
	    ;; html exports
	    (setq org-html-checkbox-type 'html)
	    
  	    (setq
  	     org-log-done t
  	     org-log-into-drawer t
  	     org-reverse-note-order t

  	     ;; Speed Commands
  	     org-use-speed-commands t


	     
  	     ;; Enforce TODO dependency chains
  	     org-enforce-todo-dependencies t

  	     ;; Syntax hilighting of code blocks in Org-Babel
  	     org-src-fontify-natively t
	     
  	     ;; Auto-indent of code blocks in Org-Babel
  	     org-src-tab-acts-natively t

  	     ;; Set Org-Files for Agenda
  	     ;; org-directory "~/org/"
  	     ;; org-agenda-files (list (concat org-directory "travail.org")(concat org-directory "perso.org")(concat org-directory "maison.org")(concat org-directory "thomas-cal.org"))
  	     org-archive-location (concat org-directory "archive/archive.org::* %s")

	     ;; column view format
	     ;; org-columns-default-format "%40ITEM(Tâche) %17Effort(Temps prévu){:} %CLOCKSUM(Temps passé) %PRIORITY(p)"
	     org-columns-default-format "%40ITEM(Tâche) %17Effort(Temps prévu){:} %CLOCKSUM(Temps passé)"

  	     ;; Mobile Org Settings
  	     ;; org-mobile-directory "~/Dropbox/Notes/"
  	     ;; org-mobile-files (list "Schedule.org" "Incoming.org")
  	     ;; org-mobile-inbox-for-pull (concat org-directory "Schedule.org")

  	     ;; Org-Babel execute without confirmation
  	     org-confirm-babel-evaluate nil

  	     ;; Org-Mode Link Search
  	     org-link-search-must-match-exact-headline nil

  	     ;; Default to Boolean Search
  	     org-agenda-search-view-always-boolean t

	     org-agenda-todo-list-sublevels t
	     
  	     ;; Export backends
  	     org-export-backends '(ascii html icalendar latex md org)
  	     org-export-coding-system 'utf-8
  	     org-export-babel-evaluate nil

  	     ;; Include Org Modules
  	     org-modules '(org-habit org-drill)

	     ;; Org-Habit Settings
  	     org-habit-preceding-days 30
  	     org-habit-following-days 3
  	     org-habit-graph-column 80

  	     ;; Setup Org Capture
  	     org-default-notes-file (concat org-directory "notes_inbox.org")

  	     org-capture-templates `(		     ;; inbox
				     ("i" "Inbox" entry (file, (concat org-directory "notes_inbox.org"))
				      "* %^{Titre}\n \n:PROPERTIES:\n:Created: %U\n %a\n:END:"
				      :prepend t
				      :kill-buffer t
				      :empty-lines 1)

				     ("t"
				      "Travail"
				      entry (file, (concat org-directory "travail.org"))  ;; pour une tâche pro
  				      "* TODO %^{Titre}\n:PROPERTIES:\n:Created: %U\n %a\n:END:"
  				      :prepend t
				      :kill-buffer t
				      :empty-lines 1)

				     ;; une tâche perso
				     ("p"
				      "Perso"
				      entry (file , (concat org-directory "perso.org"))
				      "* TODO %^{Titre}\n:PROPERTIES:\n:Created: %U\n %a\n:END:"
				      :prepend t
				      :kill-buffer t
				      :empty-lines 1)

				     ;; de l'administratif
				     ;; ("i" "Administratif" entry (file+headline "~/org/administratif.org" "Administratif")
				     ;;  "* TODO %^{Titre}\n \n:PROPERTIES:\n:Created: %U\n:END:"
				     ;;  :prepend t :kill-buffer t :empty-lines 1)

				     ;; une tâche pour la maison
				     ;; ("m" "Tâche, pour la maison" entry (file+headline "~/org/maison.org" "Maison")
				      ;; "* TODO %^{Titre}\n \n:PROPERTIES:\n:Created: %U\n:END:"
				      ;; :prepend t :kill-buffer t :empty-lines 1)

				     ;; un achat à effectuer
				     ;; ("a" "Achat" entry (file+headline "~/org/maison.org" "Maison")
				     ;;  "* TODO %^{Titre}   :acheter:\n \n:PROPERTIES:\n:Created: %U\n:END:"
				     ;;  :prepend t :kill-buffer t :empty-lines 1)
				     
				     
				     ;; un rendez-vous
				     ;; ("r" "rendez-vous" entry (file "~/org/thomas-cal.org")
				     ;;  "* %^{Titre}\n"
				     ;;  :prepend t :kill-buffer t :empty-lines 1)
				     
	                             ;; un item de wishlist
				     ("w"
				      "à lire/voir/entendre"
				      entry (file, (concat org-directory "notes_wishlist.org"))
				      "* TODO %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				      :prepend t
				      :kill-buffer t
				      :empty-lines 1)

				     ;; un groupe/compositeur/interprète
				     ("u"
				      "musique à écouter"
				      entry (file, (concat org-directory "notes_wishlist.org"))
				      "* TODO %^{Titre} :musique: \n:PROPERTIES:\n:Created: %U\n:END:"
			      :prepend t
				      :kill-buffer t
				      :empty-lines 1)
				     
				     ;; une note de travail
				     ;; ("n" "Note pro" entry (file+headline "~/org/notes_notes-pro.org" "notes-pro")
				     ;;  "* %^{Titre}\n \n:PROPERTIES:\n:Created: %U\n:END:"
				     ;;  :prepend t :kill-buffer t :empty-lines 1)

				     ;; une note d'écriture
				     ("e"
				      "Note d'écriture"
				      entry (file, (concat org-directory "notes_ecrire.org"))
				      "* %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				      :prepend t :kill-buffer t :empty-lines 1)

				     ;; un lien
				     ("l"
				      "Lien"
				      entry (file, (concat org-directory "notes_links.org"))
				      "* %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				      :prepend t :kill-buffer t :empty-lines 1)
				     
				     ;; une note technique
				     ("d" "Doc technique" entry (file, (concat org-directory "notes_docs.org"))
				      "* %^{Titre}\n"
				      :prepend t :kill-buffer t :empty-lines 1)
				     ))

	    
            ;; Org-Babel tangle
            (require 'ob-tangle)

	    (setq org-ditaa-jar-path "~/.emacs.d/contrib/ditaa0_9.jar")
	    
            ;; Setup Babel languages. Can now do Literate Programming
            (org-babel-do-load-languages 'org-babel-load-languages
                                         '((python . t)
                                           (shell . t)
                                           (emacs-lisp . t)
                                           (ledger . t)
                                           (ditaa . t)
                                           (js . t)
                                           (C . t)))

            ;; Link to specific (git) versions of a file.
	    ;;            (require 'org-git-link)

            ;; Github Link Formatter
            ;; (defun gitlink (tag)
            ;;   "converts github issues, pull requests into valid format"
            ;;   (setq ghsplit (split-string tag "/"))
            ;;   (if (string-match-p (regexp-quote "i#") (car (last ghsplit)))
            ;;       (concat (pop ghsplit) "/" (pop ghsplit) "/issues/" (substring (pop ghsplit) 2 nil))
            ;;     (if (string-match-p (regexp-quote "p#") (car (last ghsplit)))
            ;;         (concat (pop ghsplit) "/" (pop ghsplit) "/pull/" (substring (pop ghsplit) 2 nil))
            ;;       (concat "" tag))))

            ;; ;; Shorthand for links
            ;; (setq org-link-abbrev-alist '(("github" . "https://github.com/%(gitlink)")
            ;;                               ("gitlab" . "https://gitlab.com/%(gitlink)")
            ;;                               ("google" . "https://www.google.com/search?q=%s")
            ;;                               ("gmap"   . "https://maps.google.com/maps?q=%s")
            ;;                               ("osm"    . "https://nominatim.openstreetmap.org/search?q=%s&polygon=1")))

            ;; Thunderlink. Open an email in Thunderbird with ThunderLink.
            ;; (defun org-thunderlink-open (path) (start-process "myname" nil "thunderbird" "-thunderlink" (concat "thunderlink:" path)))
            ;; (org-link-set-parameters
            ;;  "thunderlink"
            ;;  :follow 'org-thunderlink-open
            ;;  :face '(:foreground "dodgerblue" :underline t))

            ;; (org-link-set-parameters
            ;;  "mu4e"
            ;;  :face '(:foreground "dodgerblue" :underline t))

            ;; (org-link-set-parameters
            ;;  "C"
            ;;  :follow '(lambda(path) (message "Link only available on Windows"))
            ;;  :face '(:foreground "darkgoldenrod" :underline t :strike-through t))

            ;; (org-link-set-parameters
            ;;  "E"
            ;;  :follow '(lambda(path) (message "Link only available on Windows"))
            ;;  :face '(:foreground "darkgoldenrod" :underline t :strike-through t))

            ;; (org-link-set-parameters
            ;;  "outlook"
            ;;  :follow '(lambda(path) (message "Outlook not available on linux"))
            ;;  :face '(:foreground "dodgerblue" :underline t :strike-through t)
            ;;  :help-echo "Outlook not available on this machine")



	    ;; -------------------------------------
	    ;; NOTIFICATIONS
	    ;; -------------------------------------
	    ;; appointments
	    ;; (require 'appt)
	    ;; (appt-activate t)

	    ;; (setq appt-message-warning-time 5) ; Show notification 5 minutes before event
	    ;; (setq appt-display-interval appt-message-warning-time) ; Disable multiple reminders
	    ;; (setq appt-display-mode-line nil)

	    ;; 				; Use appointment data from org-mode
	    ;; (defun my-org-agenda-to-appt ()
	    ;;   (interactive)
	    ;;   (setq appt-time-msg-list nil)
	    ;;   (org-agenda-to-appt))

	    ;; 				; Update alarms when...
	    ;; 				; (1) ... Starting Emacs
	    ;; (my-org-agenda-to-appt)

	    ;; 				; (2) ... Everyday at 12:05am (useful in case you keep Emacs always on)
	    ;; (run-at-time "12:05am" (* 24 3600) 'my-org-agenda-to-appt)

	    ;; 				; (3) ... When TODO.txt is saved
	    ;; (add-hook 'after-save-hook
	    ;; 	      '(lambda ()
	    ;; 		 (if (string= (buffer-file-name) (concat (getenv "HOME") "/ideas/TODO.txt"))
	    ;; 		     (my-org-agenda-to-appt))))

	    ;; 				; Display appointments as a window manager notification
	    ;; (setq appt-disp-window-function 'my-appt-display)
	    ;; (setq appt-delete-window-function (lambda () t))

	    ;; (setq my-appt-notification-app (concat (getenv "HOME") "~/scripts/appt-notification"))

	    ;; (defun my-appt-display (min-to-app new-time msg)
	    ;;   (if (atom min-to-app)
	    ;; 	  (start-process "my-appt-notification-app" nil my-appt-notification-app min-to-app msg)
	    ;; 	(dolist (i (number-sequence 0 (1- (length min-to-app))))
	    ;; 	  (start-process "my-appt-notification-app" nil my-appt-notification-app (nth i min-to-app) (nth i msg)))))
	    ;; ;; -------------------------------------
	    ;; FIN NOTIFICATIONS
	    ;; -------------------------------------
  	    

	    ;; Make appt aware of appointments from the agenda
	    ;; (defun org-agenda-to-appt ()
	    ;;   "Activate appointments found in `org-agenda-files'."
	    ;;   (interactive)
	    ;;   (require 'org)
	    ;;   (let* ((today (org-date-to-gregorian
	    ;; 		     (time-to-days (current-time))))
	    ;; 	     (files org-agenda-files) entries file)
	    ;; 	(while (setq file (pop files))
	    ;; 	  (setq entries (append entries (org-agenda-get-day-entries
	    ;; 					 file today :timestamp))))
	    ;; 	(setq entries (delq nil entries))
	    ;; 	(mapc (lambda(x)
	    ;; 		(let* ((event (org-trim (get-text-property 1 'txt x)))
	    ;; 		       (time-of-day (get-text-property 1 'time-of-day x)) tod)
	    ;; 		  (when time-of-day
	    ;; 		    (setq tod (number-to-string time-of-day)
	    ;; 			  tod (when (string-match
	    ;; 				     "\\([0-9]\\{1,2\\}\\)\\([0-9]\\{2\\}\\)" tod)
	    ;; 				(concat (match-string 1 tod) ":"
	    ;; 					(match-string 2 tod))))
	    ;; 		    (if tod (appt-add tod event))))) entries)))
	    
	    ;; ---------------------------------------
	    ;; from : <https://whhone.com/posts/org-mode-task-management/>
	    ;; Emacs Easy Customization ("M-x customize") syntax is used.
	    ;; If you prefer using .el files directly, set it with "setq".
	    
	    ;; TODO keywords.
	    ;; (setq org-todo-keywords
	    ;; '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
	    (setq org-todo-keywords
		  '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "CANCELED(c)" "DONE(d)")))
	    
	    ;; Show the daily agenda by default.
	    (setq org-agenda-span 'day)
	    
	    ;; Hide tasks that are scheduled in the future.
	    ;; (setq org-agenda-todo-ignore-scheduled 'future)
	    
	    ;; Use "second" instead of "day" for time comparison.
	    ;; It hides tasks with a scheduled time like "<2020-11-15 Sun 11:30>"
	    (setq org-agenda-todo-ignore-time-comparison-use-seconds t)
	    
	    ;; Hide the deadline prewarning prior to scheduled date.
	    (setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
	    
	    ;; (setq org-agenda-custom-commands
	    ;; 	  '(("n" "Agenda / INTR / PROG / NEXT"
	    ;; 	     ((agenda "" nil)
	    ;; 	      (todo "INTR" nil)
	    ;; 	      (todo "PROG" nil)
	    ;; 	      (todo "NEXT" nil))
	    ;; 	     nil)))
	    ;; ---------------------------------

	    (require 'org-collector)

	    ;; (use-package org-ql
	    ;;   :quelpa (org-ql :fetcher github :repo "alphapapa/org-ql"
	    ;; 		      :files (:defaults (:exclude "helm-org-ql.el"))))""
	    
  	    (require 'org-contacts)
  	    (setq org-contacts-files (list (concat org-directory "contacts.org")))))




;; permet de définir la journée de travail à 8 heures dans org-mode
;; <https://emacs.stackexchange.com/questions/51114/set-org-duration-units-for-org-mode-scheduling#tab-top>
(use-package org-duration
  :config
  ;; permet d'afficher le temps passé en hours:minutes seulement (et pas en day:hour:minutes, comme par défaut)
  ;; les lignes commentées en dessous, permettent tout de même de configurer 1 day=8heures, ce qui donne quelque chose de cohérent si jamais on veut repasser au format day:hour:minutes
  ;; (setq org-duration-format (quote h:mm))
  (setq org-duration-units   `(("min" . 1)
			       ("h" . 60)
			       ("d" . ,(* 60 7))
			       ("w" . ,(* 60 7 5))
			       ("m" . ,(* 60 7 5 4))
			       ("y" . ,(* 60 7 5 4 11))))
  (org-duration-set-regexps)
  )

;; (load "org-caldav")
;; Calendrier de Thomas
;; (setq org-caldav-url "https://framagenda.org/remote.php/dav/calendars/patjennings/"
      ;; org-caldav-calendar-id "thomas"
      ;; org-caldav-inbox "~/org/thomas-cal.org"
      ;; org-icalendar-timezone "Europe/Paris")
      ;; )

;; Calendrier de Clém
;; (setq org-caldav-url "https://framagenda.org/remote.php/dav/calendars/clemencegantois/"
;;       org-caldav-calendar-id "personal"
;;       org-caldav-inbox "~/org/clemence-cal.org"
;;       org-icalendar-timezone "Europe/Paris")

;; (setq org-caldav-calendars
;;       '((:calendar-id "thomas"
;; 		      :inbox "~/org/thomas-cal.org"
;; 		      ;; :file "~/org/thomas-cal.org"
;; 		      :icalendar-timezone "Europe/Paris")))
	;; (:calendar-id "clemence-1"
	;; 	      :inbox "~/org/clemence-cal.org"
	;; 	      ;; :file "~/org/clemence-cal.org"
	;; 	      :icalendar-timezone "Europe/Paris"))) 

;; ----------------
;; ORG-PUBLISH
;; ----------------
(require 'ox-publish)
(setq org-publish-project-alist
      '(
	("server-notes"
	 :base-directory "~/Dropbox/org/"
	 :base-extension "org"
	 ;; :publishing-directory "~/public_html/"
	 :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	 :recursive nil
	 :exclude "administratif.org\\|contacts.org\\|gestion.org\\|perso.org\\|travail.org\\|notes_famille.org\\|notes_ecrire.org\\|notes_pro.org\\|notes_perso.org\\|notes_inbox.org\\|notes_son.org"
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )
	("server-static"
	 :base-directory "~/Dropbox/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	 ;; :publishing-directory "~/public_html/"
	 :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("server" :components ("server-notes" "server-static"))
	("local-notes"
	 :base-directory "~/Dropbox/org/"
	 :base-extension "org"
	 :publishing-directory "~/public_html/"
	 :recursive nil
	 :exclude "administratif.org\\|contacts.org\\|gestion.org\\|perso.org\\|travail.org\\|notes_famille.org\\|notes_ecrire.org\\|notes_pro.org\\|notes_perso.org\\|notes_inbox.org\\|notes_son.org"
	 :publishing-function org-html-publish-to-html
	 :headline-levels 4             ; Just the default for this project.
	 :auto-preamble t
	 )
	("local-static"
	 :base-directory "~/Dropbox/org/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	 :publishing-directory "~/public_html/"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("local" :components ("local-notes" "local-static"))
	))


;; --------
;; MAGIT
;; --------
;; (add-hook 'magit-process-find-password-functions
          ;; 'magit-process-password-auth-source)

;; --------
;; CALENDAR
;; --------

(add-hook 'calendar-load-hook
	  (lambda ()
	    (calendar-set-date-style 'european)))

(setq calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
			       "Jeudi" "Vendredi" "Samedi"]
      calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
				 "Juin" "Juillet" "Août" "Septembre"
				 "Octobre" "Novembre" "Décembre"])

;; -----------
;; HELM CONFIG
;; -----------

(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)

(helm-mode 1)

;; --------
;; SSH
;; --------

(require 'ssh)
(add-hook 'ssh-mode-hook
	  (lambda ()
	    (setq ssh-directory-tracking-mode t)
	    (shell-dirtrack-mode t)
	    (setq dirtrackp nil)))

;; --------
;; UTILS
;; --------

;; Emacs devine où copier le fichier
;; Vu ici : https://emacs.stackexchange.com/questions/5603/how-to-quickly-copy-move-file-in-emacs-dired
(setq dired-dwim-target t)

;; Ouvrir un dossier dans le navigateur du système
(defun pjn-show-in-desktop ()
  "Show current file in desktop.
 (Mac Finder, Windows Explorer, Linux file manager)
 This command can be called when in a file or in `dired'.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2018-09-29"
  (interactive)
  (let (($path (if (buffer-file-name) (buffer-file-name) default-directory )))
    (cond
     ((string-equal system-type "windows-nt")
      (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" $path t t)))
     ((string-equal system-type "darwin")
      (if (eq major-mode 'dired-mode)
          (let (($files (dired-get-marked-files )))
            (if (eq (length $files) 0)
                (progn
                  (shell-command
                   (concat "open " default-directory)))
              (progn
                (shell-command
                 (concat "open -R " (shell-quote-argument (car (dired-get-marked-files ))))))))
        (shell-command
         (concat "open -R " $path))))
     ((string-equal system-type "gnu/linux")
      (let (
            (process-connection-type nil)
            (openFileProgram (if (file-exists-p "/usr/bin/gvfs-open")
                                 "/usr/bin/gvfs-open"
                               "/usr/bin/xdg-open")))
        (start-process "" nil openFileProgram $path))
      (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. eg with nautilus
      ))))



;; rechercher un pattern, et le copier dans un nouveau buffer
;; https://stackoverflow.com/questions/2289883/emacs-copy-matching-lines
(defun copy-lines-matching-re (re)
  "find all lines matching the regexp RE in the current buffer
putting the matching lines in a buffer named *matching*"
  (interactive "sRegexp to match: ")
  (let ((result-buffer (get-buffer-create "*matching*")))
    (with-current-buffer result-buffer 
      (erase-buffer))
    (save-match-data 
      (save-excursion
        (goto-char (point-min))
        (while (re-search-forward re nil t)
          (princ (buffer-substring-no-properties (line-beginning-position) 
                                                 (line-beginning-position 2))
                 result-buffer))))
    (pop-to-buffer result-buffer)))

;; --------
;; VISUAL
;; --------

;; theme + font
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'doom-one)
;; (load-theme 'doom-one-light)
;; (load-theme 'doom-one-light-thomas)

;; (after! solaire-mode
  ;; (solaire-global-mode -1))

;; (set-frame-font "Liberation Mono 11" nil t)
;; (set-frame-font "Sometype Mono 11" nil t)
;; (set-frame-font "iA Writer Mono S 11" nil t)
(set-frame-font "JetBrains Mono 11" nil t)

;; (setq eww-toggle-fonts 0)

;; frame size at start
;; (when window-system (set-frame-size (selected-frame) 120 60))

(tool-bar-mode 0) ;; on n'affiche pas les icones
(menu-bar-mode 0)

;; You can also set the initial frame parameters
;; (setq initial-frame-alist
;;       '((menu-bar-lines . 0)
;;         (tool-bar-lines . 0)))
;; (setq initial-frame-alist
;;       '((tool-bar-lines . 0)))

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 210) ; chars
              (height . 60) ; lines
              ;; (background-color . "honeydew")
              (left . 0)
              (top . 0)))
      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 210)
              (height . 60)
              ;; (background-color . "honeydew")
              (left . 0)
              (top . 0))))
  (progn
    (setq initial-frame-alist '( (tool-bar-lines . 0)))
    (setq default-frame-alist '( (tool-bar-lines . 0)))))

;; Huuu, pour avoir de grosses marges de chaque côté de l'écran
;; From https://bzg.fr/en/emacs-strip-tease.html/

;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))


;; Set the color of the fringe


;; Now activate this global minor mode
(bzg-big-fringe-mode 0)

(use-package sr-speedbar
  :bind ("<f5>" . sr-speedbar-toggle)
  :bind ("<f6>" . sr-speedbar-refresh-toggle)
  :commands (sr-speedbar-toggle)
  :config
  (setq speedbar-directory-unshown-regexp "^$")

  (make-face 'speedbar-face)
  (set-face-font 'speedbar-face "JetBrains Mono 11")
  (setq speedbar-mode-hook '(lambda () (buffer-face-set 'speedbar-face)))

  (setq speedbar-show-unknown-files t) ; show all files
  (setq speedbar-use-images nil) ; use text for buttons
  (setq sr-speedbar-right-side nil) ; put on left side
  (setq sr-speedbar-refresh-turn-off t)
  (setq sr-speedbar-refresh-turn-on nil)
  (add-hook 'speedbar-mode-hook (lambda()(display-line-numbers-mode -1))))
;; (require 'sr-speedbar)

;; (setq sr-speedbar-open 1)
;; (speedbar 1)

;; ----
;; MU4E
;; ----

;; pour la lecture des mails, c'est effecuté avec Gnus depuis la version 1.6 de mu4e
;; Voir la partie GNUS de ce fichier pour le formatage

;; mu4e - pour que M-x mu4e fonctionne !
;; Etonnant, il faut aussi appeler mu4e pour que org-agenda fonctionn
(add-to-list 'load-path "~/.emacs.d/plugins/mu4e")
(require 'mu4e)
;; (require 'mu4e-contrib)
;; (require 'org-mu4e)
(setq mail-personal-alias-file (expand-file-name "~/.mailrc"))
;; (setq mu4e-view-html-plaintext-ratio-heuristic most-positive-fixnum)
;; (setq mu4e-org-contacts-file  (concat org-directory "contacts.org"))
(setq mu4e-attachment-dir "~/Desktop")

;; (setq mu4e-face)
;; (setq mu4e-html2text-command "w3m -dump -T text/html -cols 80 -o display_link_number=true -o auto_image=false -o display_image=false -o ignore_null_img_alt=true")
;; (setq mu4e-html2text-command "html2text -utf8 -width 72")

;; old message view (vs gnus base message view, since mu4e version 1.6)
;; (setq mu4e-view-use-old t)

(setq gnus-unbuttonized-mime-types nil)


(setq mu4e-view-prefer-html nil)
(setq mu4e-view-show-images nil)
(setq mu4e-show-images nil)
(setq mu4e-confirm-quit nil)

(setq auth-source-debug t)
(setq auth-source-do-cache nil)

(setq mu4e-compose-dont-reply-to-self t)
(setq mu4e-compose-signature-auto-include t)
;; (setq mu4e-user-mail-address-list (list "bonjour@thomasguesnon.fr" "amenagements@kernavelo.org" "contact@kernavelo.org"))
(setq message-kill-buffer-on-exit t)

(setq mu4e-headers-show-threads nil)

(setq mu4e-org-contacts-file  (concat org-directory "contacts.org"))
(add-to-list 'mu4e-headers-actions
	     '("org-contact-add" . mu4e-action-add-org-contact) t)
(add-to-list 'mu4e-view-actions
	     '("org-contact-add" . mu4e-action-add-org-contact) t)

(setq mu4e-headers-fields
      '((:human-date    .  30)    ;; alternatively, use :human-date
	(:subject       .  80)
	(:flags         .   6)
	(:from          .  30)
	(:to            .  30)
	(:size          .  6)
	(:maildir       .  15)))

(setq mu4e-headers-date-format "%a %d %b %Y, %H:%M")

;; the following is to show shortcuts in the main view.
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Unread in bonjour"
;;               :query "maildir:/bonjour/INBOX AND flag:unread"
;;               :key ?v))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - bonjour"
;;               :query "maildir:/bonjour/INBOX"
;;               :key ?b))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - Kernavélo aménagements"
;;               :query "maildir:/knvlamenagements/INBOX"
;;               :key ?a))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - Kernavélo contact"
;;               :query "maildir:/knvlcontact/INBOX"
;;               :key ?c))


;; smtp config
(require 'smtpmail)

;; (setq send-mail-function 'smtpmail-send-it)
;; (setq smtpmail-stream-type 'ssl)
(setq sendmail-program "/usr/bin/msmtp"
      send-mail-function 'smtpmail-send-it
      message-sendmail-f-is-evil t
      message-sendmail-extra-arguments '("--read-envelope-from")
      message-send-mail-function 'message-send-mail-with-sendmail)


;; (setq smtpmail-smtp-user "bonjour@thomasguesnon.fr")
;; (setq smtpmail-default-smtp-server "ssl0.ovh.net")
;; (setq smtpmail-smtp-server "ssl0.ovh.net")
;; (setq smtpmail-smtp-service 465)

;; (setq mu4e-view-show-images nil)
;; (setq mu4e-view-image-max-width 320)

;; (defun my-mu4e-set-account ()
;;   ;; "Set the account for composing a message.
;;   ;; This function is taken from: 
;;   ;; https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
;;   (let* ((account
;; 	  (if mu4e-compose-parent-message
;;               (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;; 		(string-match "/\\(.*?\\)/" maildir)
;; 		(match-string 1 maildir))
;; 	    (completing-read (format "Compose with account: (%s) "
;; 				     (mapconcat #'(lambda (var) (car var))
;; 						my-mu4e-account-alist "/"))
;; 			     (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;; 			     nil t nil nil (caar my-mu4e-account-alist))))
;; 	 (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;; 	(mapc #'(lambda (var)
;; 		  (set (car var) (cadr var)))
;;               account-vars)
;;       (error "No email account found"))))
;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)


;; lires les mails html dans le browser de'emacs (eww)
;; source : https://irreal.org/blog/?p=9587
(defun jcs-view-in-eww (msg)
  "Display current message in EWW browser."
  (eww-browse-url (concat "file://" (mu4e~write-body-to-html msg))))


;; Now I set a list of
;; (defvar my-mu4e-account-alist
;;   '(("bonjour@thomasguesnon.fr"
;;      (mu4e-sent-folder "/bonjour/INBOX.INBOX.Sent")
;;      (mu4e-drafts-folder "/bonjour/INBOX.INBOX.Drafts")
;;      (mu4e-trash-folder "/bonjour/INBOX.INBOX.Trash")
;;      ;; (mu4e-refile-folder "/bonjour/INBOX.Archive")
;;      (user-mail-address "bonjour@thomasguesnon.fr")
;;      (mu4e-compose-signature t)
;;      (mu4e-compose-signature-auto-include t)
;;      (message-signature-file "~/sig-thomas")
;;      (smtpmail-smtp-user "bonjour@thomasguesnon.fr")
;;      (user-full-name "Thomas Guesnon")
;;      (smtpmail-default-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-service 465)
;;      )
;;     ("amenagements@kernavelo.org"
;;      (mu4e-sent-folder "/knvlamenagements/INBOX.Sent")
;;      (mu4e-drafts-folder "/knvlamenagements/INBOX.Drafts")
;;      (mu4e-trash-folder "/knvlamenagements/INBOX.Trash")
;;      (mu4e-refile-folder "/knvlamenagements/Archive")
;;      (user-mail-address "amenagements@kernavelo.org")
;;      (mu4e-compose-signature nil)
;;      (user-full-name "Thomas du GT Aménagements")
;;      (smtpmail-smtp-user "amenagements@kernavelo.org")
;;      (smtpmail-default-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-service 465)
;;      )
;;     ("contact@kernavelo.org"
;;      (mu4e-sent-folder "/knvlcontact/INBOX.Sent")
;;      (mu4e-drafts-folder "/knvlcontact/INBOX.Drafts")
;;      (mu4e-trash-folder "/knvlcontact/INBOX.Trash")
;;      (mu4e-refile-folder "/knvlcontact/Archive")
;;      (user-mail-address "contact@kernavelo.org")
;;      (mu4e-compose-signature nil)
;;      (user-full-name "Thomas de Kernavélo")
;;      (smtpmail-smtp-user "contact@kernavelo.org")
;;      (smtpmail-default-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-server "ssl0.ovh.net")
;;      (smtpmail-smtp-service 465)
;;      )
;;     ))
;;mail aliases for lists (address lists)

;; the following is to show shortcuts in the main view.
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Unread in bonjour"
;;               :query "maildir:/bonjour/INBOX AND flag:unread"
;;               :key ?v))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - bonjour"
;;               :query "maildir:/bonjour/INBOX"
;;               :key ?b))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - Kernavélo aménagements"
;;               :query "maildir:/knvlamenagements/INBOX"
;;               :key ?a))
;; (add-to-list 'mu4e-bookmarks
;;              (make-mu4e-bookmark
;;               :name "Inbox - Kernavélo contact"
;;               :query "maildir:/knvlcontact/INBOX"
;;               :key ?c))


(setq mu4e-contexts
      `( ,(make-mu4e-context
	   :name "bonjour@thomasquesnon.fr"
	   :enter-func (lambda () (mu4e-message "Bienvenue dans bonjour"))
           :leave-func (lambda () (mu4e-message "On quitte bonjour"))
	   :match-func (lambda (msg) (when msg
				       (string-prefix-p "^/bonjour" (mu4e-message-field msg :maildir))))
	   :vars '(
		   (mu4e-sent-folder             . "/bonjour/INBOX.INBOX.Sent")
		   (mu4e-drafts-folder           . "/bonjour/INBOX.INBOX.Drafts")
		   (mu4e-trash-folder            . "/bonjour/INBOX.INBOX.Trash")
		   ;; (mu4e-refile-folder "/bonjour/INBOX.Archive")
		   (user-mail-address            . "bonjour@thomasguesnon.fr")
		   (mu4e-compose-signature       . t)
		   (mu4e-compose-signature-auto-include . t)
		   (message-signature-file       . "~/sig-thomas")
		   (smtpmail-smtp-user           . "bonjour@thomasguesnon.fr")
		   (user-full-name               . "Thomas Guesnon")
		   (smtpmail-default-smtp-server . "ssl0.ovh.net")
		   (smtpmail-smtp-server         . "ssl0.ovh.net")
		   (smtpmail-smtp-service        . 465)
		   (mu4e-maildir-shortcuts . (("/bonjour/INBOX" . ?i)
					      ("/bonjour/INBOX.INBOX.Sent" . ?s)
					      ("/bonjour/INBOX.INBOX.Drafts" . ?d)
                                              ("/bonjour/INBOX.INBOX.Trash" . ?t)
					      ))
		   (mu4e-bookmarks . (("maildir:/bonjour/INBOX AND flag:unread" "Non-lus" ?u)))
		   ;; (add-to-list 'mu4e-bookmarks
		   ;; 		(make-mu4e-bookmark
		   ;; 		 :name "Unread in bonjour"
		   ;; 		 :query "maildir:/bonjour/INBOX AND flag:unread"
		   ;; 		 :key ?v))
		   ))
	 ,(make-mu4e-context
	   :name "amenagements@kernavelo.org"
	   :enter-func (lambda () (mu4e-message "Bienvenue dans amenagements"))
	   :leave-func (lambda () (mu4e-message "On quitte amenagements"))
	   :match-func (lambda (msg) (when msg
				       (string-prefix-p "^/knvlamenagements" (mu4e-message-field msg :maildir))))
	   :vars '(
		   (mu4e-sent-folder             . "/knvlamenagements/INBOX.Sent")
		   (mu4e-drafts-folder           . "/knvlamenagements/INBOX.Drafts")
		   (mu4e-trash-folder            . "/knvlamenagements/INBOX.Trash")
		   (mu4e-refile-folder           . "/knvlamenagements/Archive")
		   (user-mail-address            . "amenagements@kernavelo.org")
		   (mu4e-compose-signature       . nil)
		   (user-full-name               . "Thomas du GT Aménagements")
		   (smtpmail-smtp-user           . "amenagements@kernavelo.org")
		   (smtpmail-default-smtp-server . "ssl0.ovh.net")
		   (smtpmail-smtp-server         . "ssl0.ovh.net")
		   (smtpmail-smtp-service        . 465)
		   (mu4e-maildir-shortcuts . (("/knvlamenagements/INBOX" . ?i)
					      ("/knvlamenagements/INBOX.Sent" . ?s)
					      ("/knvlamenagements/INBOX.Drafts" . ?d)
                                              ("/knvlamenagements/INBOX.Trash" . ?t)
					      ))
		   (mu4e-bookmarks . (("maildir:/knvlamenagements/INBOX AND flag:unread" "Non-lus" ?u)))
		   ))
	 ,(make-mu4e-context
	   :name "contact@kernavelo.org"
	   :enter-func (lambda () (mu4e-message "Bienvenue dans contact"))
	   :leave-func (lambda () (mu4e-message "On quitte contact"))
	   :match-func (lambda (msg) (when msg
				       (string-prefix-p "^/knvlcontact" (mu4e-message-field msg :maildir))))
	   :vars '(
		   (mu4e-sent-folder             . "/knvlcontact/INBOX.Sent")
		   (mu4e-drafts-folder           . "/knvlcontact/INBOX.Drafts")
		   (mu4e-trash-folder            . "/knvlcontact/INBOX.Trash")
		   (mu4e-refile-folder           . "/knvlcontact/Archive")
		   (user-mail-address            . "contact@kernavelo.org")
		   (mu4e-compose-signature       . nil)
		   (user-full-name               . "Thomas de Kernavélo")
		   (smtpmail-smtp-user           . "contact@kernavelo.org")
		   (smtpmail-default-smtp-server . "ssl0.ovh.net")
		   (smtpmail-smtp-server         . "ssl0.ovh.net")
		   (smtpmail-smtp-service        . 465)
		   (mu4e-maildir-shortcuts . (("/knvlcontact/INBOX" . ?i)
					      ("/knvlcontact/INBOX.Sent" . ?s)
					      ("/knvlcontact/INBOX.Drafts" . ?d)
                                              ("/knvlcontact/INBOX.Trash" . ?t)
					      ))
		   (mu4e-bookmarks . (("maildir:/knvlcontact/INBOX AND flag:unread" "Non-lus" ?u)))
		   ))
   ))
 ;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
  ;; guess or ask the correct context, e.g.

  ;; start with the first (default) context;
  ;; default is to ask-if-none (ask when there's no context yet, and none match)
  (setq mu4e-context-policy 'pick-first)

  ;; compose with the current context is no context matches;
  ;; default is to ask
  (setq mu4e-compose-context-policy nil)


;; (setq mu4e-html2text-command  "w3m -T text/html")
;; mu4e-alert
;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-html2text-command "html2text -utf8 -width 72") ;;seems to be doing a better job than w3m
;;   ;; (setq mu4e-html2text-command "html2text" ;;seems to be doing a better job than w3m
;; 	;; )
;;   (setq mu4e-alert-interesting-mail-query
;; 	(concat
;; 	 "flag:unread maildir:/bonjour/INBOX "
;; 	 ))
;;   (mu4e-alert-enable-mode-line-display)
;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
;;     (interactive)
;;     (mu4e~proc-kill)
;;     (mu4e-alert-enable-mode-line-display)
;;     )
;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
;;   )


;; (add-to-list 'mu4e-view-actions
	     ;; '("org-contact-add" . mu4e-action-add-org-contact) t)

;; (setq mu4e-view-actions
;;       '(("capture message" . mu4e-action-capture-message)
;; 	("org-contact-add" . mu4e-action-add-org-contact)
;; 	("View as pdf" . mu4e-action-view-as-pdf)
;; 	("show this thread" . mu4e-action-show-thread)
;; 	("viewInBrowser" . mu4e-action-view-in-browser)
;; 	("eww view" . jcs-view-in-eww)))



;; (add-to-list 'mu4e-header-info-custom
;;   '(:recipnum .
;;      ( :name "Number of recipients"  ;; long name, as seen in the message-view
;;        :shortname "Recip#"           ;; short name, as seen in the headers view
;;        :help "Number of recipients for this message" ;; tooltip
;;        :function (lambda (msg)
;;           (format "%d"
;;             (+ (length (mu4e-message-field msg :to))
;;                (length (mu4e-message-field msg :cc))))))))



;; ---------------
;; END MU4E CONFIG
;; ---------------

;; ---------------
;; INTERPRETER
;; ---------------
(setq python-shell-interpreter "/usr/bin/python3")
(put 'downcase-region 'disabled nil)

;; ----------
;; PROCESSING
;; ----------
(setq processing-location "/usr/local/bin/processing-java")

;; --------------------
;; OPEN IN EXTERNAL APP
;; see http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html
;; --------------------
(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.

When called in emacs lisp, if @fname is given, open that.

URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (w32-shell-execute "open" $fpath)) $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))

;; ---------------
;; OPEN IN TERMINAL
;; ----------------
(defun xah-open-in-terminal ()
  "Open the current dir in a new terminal window.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04"
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (let ((process-connection-type nil))
      (start-process "" nil "powershell" "start-process" "powershell"  "-workingDirectory" default-directory)))
   ((string-equal system-type "darwin")
    (let ((process-connection-type nil))
      (start-process "" nil "/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal" default-directory)))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil))
      (start-process "" nil "x-terminal-emulator"
                     (concat "--working-directory=" default-directory))))))


;; ----------------------------
;; SORT BY different criterias
;; ----------------------------

(defun dired-sort-criteria (criteria)
  "sort-dired by different criteria by Robert Gloeckner "
  (interactive 
   (list 
    (or (completing-read "criteria [name]: "
			 '("size(S)" "extension(X)" "creation-time(ct)"
			   "access-time(ut)" "time(t)" "name()"))
	"")))
  (string-match ".*(\\(.*\\))" criteria)
  (dired-sort-other
   (concat dired-listing-switches 
	   (match-string 1 criteria))))

(setq dired-listing-switches "-alh")
;; ------------------
;; ORG-ROAM
;; ------------------
;; (add-hook 'after-init-hook 'org-roam-mode)

;; (use-package org-roam
;;   :ensure t
;;   :hook
;;   (after-init . org-roam-mode)
;;   :custom
;;   (org-roam-directory "~/Documents/notes")
;;   :bind (:map org-roam-mode-map
;;               (("C-c n l" . org-roam)
;;                ("C-c n f" . org-roam-find-file)
;;                ("C-c n g" . org-roam-graph)
;; 	       ("C-c n t" . org-roam-tag-add))
;;               :map org-mode-map
;;               (("C-c n i" . org-roam-insert))
;;               (("C-c n I" . org-roam-insert-immediate)))
;;   :config(progn
;; 	   (setq org-roam-capture-templates
;; 		 '(("d" "default" plain (function org-roam-capture--get-point)
;; 		    "%?"
;; 		    :file-name "%<%Y%m%d%H%M%S>-${slug}"
;; 		    :head "#+title: ${title}\n"
;; 		    :immediate-finish t
;; 		    :unnarrowed t)
;; 		   ))))

;; (add-hook 'org-mode-hook (lambda ()
;; 				(visual-line-mode t)))

;; -----------------
;; ORG-JOURNAL
;; -----------------
(use-package org-journal
  :bind
  ("C-c j" . org-journal-new-entry)
  ("C-c b" . org-journal-previous-entry)
  ("C-c f" . org-journal-next-entry)
  ("C-c C-j" . org-journal-open-current-journal-file)
  :config
  (setq org-journal-dir (concat org-directory "notes")
	org-journal-date-prefix "#+title: "
	org-journal-file-format "%Y%m%d.org"
	org-journal-date-format "%Y/%m/%d, %A\n"))


;; ----
;; DEFT
;; ----
(use-package deft
  :bind ("<f8>" . deft)
  :commands (deft)
  :after org
  :config
  (setq deft-recursive nil)
  (setq deft-directory (concat org-directory "notes"))
  (setq deft-directory org-directory)
  ;; (setq deft-use-filter-string-for-filename t)
  (setq deft-default-extension "org")
  (setq deft-incremental-search t)
  (add-hook 'after-init-hook 'org-roam-db-build-cache))



;; delete elements to trash can
(setq delete-by-moving-to-trash t)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If ou edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(Linum-format "%7i ")
;;  '(ansi-color-names-vector
;;    ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
;;  '(custom-enabled-themes '(tango-dark))
;;  '(custom-safe-themes
;;    '("ae30c27916f58eb24285b19d52e2c4ae36b862a3856bbbc5e932f5d436dc7d61" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" default))
;;  '(doc-view-continuous t)
;;  '(fci-rule-character-color "#202020")
;;  '(fci-rule-color "#202020")
;;  '(fringe-mode 4 nil (fringe))
;;  '(main-line-color1 "#1E1E1E")
;;  '(main-line-color2 "#111111")
;;  '(main-line-separator-style 'chamfer)
;;  '(org-roam-directory "~/Documents/notes" nil nil "Customized with use-package org-roam")
;;  '(package-selected-packages
;;    '(flucui-themes soothe-theme deft org-journal org-roam yaml-mode yasnippet-snippets wrap-region web-mode visual-regexp use-package rjsx-mode processing-mode pomidor php-mode org-vcard org-plus-contrib org-agenda-property markdown-mode magit less-css-mode helm-swoop helm-c-yasnippet emms auto-complete))
;;  '(powerline-color1 "#1E1E1E")
;;  '(powerline-color2 "#111111")
;;  '(send-mail-function 'smtpmail-send-it)
;;  '(speedbar-show-unknown-files t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(fringe ((t (:background "#2D3335")))))

(scroll-bar-mode -1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-width 4)
(global-hl-line-mode 1)
(add-hook 'dired-mode-hook (lambda()(display-line-numbers-mode -1)))
;; (add-hook 'org-mode-hook (lambda ()(display-line-numbers-mode -1)))
(add-hook 'deft-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'org-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'org-agenda-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'mu4e-main-mode-hook (lambda () (display-line-numbers-mode -1)))
(add-hook 'mu4e-headers-mode-hook (lambda () (display-line-numbers-mode -1)))

;; retire le warning au démarrage pour emacs 27.1
(setq byte-compile-warnings '(cl-functions))

(setq dynamic-library-alist
      '((jpeg "libjpeg8" "libjpeg-turbo8" "libjpeg62-turbo")))


;; (setq org-agenda-prefix-format '((todo . "%-30b") (tags . "%-30b") (agenda . "%-30b")))
;; (setq org-agenda-prefix-format '((todo . "%-30b") (tags . "%-30b") (agenda . "%-30b")))
;; (setq org-agenda-prefix-format '((todo . "  %-12:b%?-12t% s") (agenda . "  %-12:b%?-12t% s")))
(setq org-agenda-prefix-format '((todo . "%c : %b % s") (agenda . "  %-12:b%? t%c %b % s")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((dot . t))) ; this line activates dot

(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                    :height .7)
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))

;;-----------
;; SHORTCUTS
;;-----------
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c C-v C-c") 'cfw:open-org-calendar)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-c h") 'helm-mini)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "C-c t") 'pjn-show-in-desktop)
(global-set-key (kbd "<f7>") 'bzg-big-fringe-mode)


;; ----
;; GNUS
;; ----
(require 'mm-view)
(setq mm-text-html-renderer 'lynx)
(setcdr (assoc 'lynx mm-text-html-renderer-alist)
        '(mm-inline-render-with-stdin
          nil "lynx" "-dump" "-force_html" "-stdin" "-display_charset=UTF-8"))

(defvar mm-insert-inline-use-utf-8 nil)

(defadvice mm-insert-inline (around mm-insert-inline-utf-8)
  (let ((x (point)))
    (prog1 (progn ad-do-it)
      (when mm-insert-inline-use-utf-8
        (decode-coding-region x (point-max) 'utf-8)))))
(ad-activate 'mm-insert-inline)

(defadvice mm-inline-text-html (around mm-inline-text-html-utf-8)
  (let ((mm-insert-inline-use-utf-8 t))
    ad-do-it))
(ad-activate 'mm-inline-text-html)


;; -------------
;; EMMS
;; -------------
(require 'emms-setup)
(require 'emms-player-vlc)
(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory (concat default-directory "/son/_Exports"))

(setq emms-player-vlc-command-name "/usr/bin/vlc")


;; ----------------------
;; WEATHER
;; ----------------------
;; weather from wttr.in
(use-package wttrin
  :ensure t
  :commands (wttrin)
  :init
  (setq wttrin-default-cities '("Quimper"
                                "Paris")))



(use-package typit
  :ensure t
  :commands (typit))

;; override all background-color settings
;; (set-background-color pjn-bg-color)



;; ---------
;; PERSO
;; ---------
;; syntaxe w/ run-at-time : https://emacs.stackexchange.com/questions/7872/unable-to-restart-or-update-a-timer
(setq pjn-pause-interval 3600)
(defun pjn-pause-start ()
  (interactive
   (progn
     (message "pjnPause démarre")
     (setq timer
	   (run-at-time (current-time) pjn-pause-interval 'pjn-pause-notify)
	   ))))
(defun pjn-pause-stop ()
  (interactive
   (progn
     (message "pjnPause est arrêté")
     (cancel-timer timer)
     )))
(defun pjn-pause-notify ()
  (shell-command "notify-send 'Pause' 'Arrête un peu…'")
  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
