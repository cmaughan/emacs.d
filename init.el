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

(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key (kbd "C-k C-o") 'ff-find-other-file)))

; Load configuration modules
(load-user-file "evil.el")
(load-user-file "appearance.el")

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)

; Determine the underlying operating system
(setq is-aquamacs (featurep 'aquamacs))
(setq is-linux (featurep 'x))
(setq is-win32 (not (or is-aquamacs is-linux)))

; Best way to get a full screen window on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; Stop the bell ringing all the time
(defun nil-bell ())
(setq ring-bell-function 'nil-bell)
