; Use the package manager
(require 'package)

(add-to-list 'package-archives
	'("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)

	(add-to-list 'package-archives
		'("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(add-to-list 'load-path "~/.emacs.d/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
; Open at current file dir when tree is opened
(setq neo-smart-open t)

; Load configuration modules
(load-user-file "evil.el")
(load-user-file "appearance.el")
