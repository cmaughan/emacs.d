(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-directory "~/Dropbox/GTD/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(define-key global-map "\C-cc" 'org-capture)
