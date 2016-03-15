; Setup initial directory search
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(auto-save-default nil)
 '(auto-save-interval 0)
 '(auto-save-list-file-prefix nil)
 '(auto-save-timeout 0)
 '(auto-show-mode t t)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("ca38a25a33e00c6b38d1791d78bf9c22bbbf8eab5343cf9009b91c0df0604b7c" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(delete-auto-save-files nil)
 '(delete-old-versions (quote other))
 '(helm-ag-base-command "pt --nocolor --nogroup")
 '(helm-follow-mode-persistent t)
 '(imenu-auto-rescan t)
 '(imenu-auto-rescan-maxout 500000)
 '(inhibit-startup-screen t)
 '(kept-new-versions 5)
 '(kept-old-versions 5)
 '(make-backup-file-name-function (quote ignore))
 '(make-backup-files nil)
 '(mouse-wheel-follow-mouse nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (15)))
 '(version-control nil))

(defun post-load-stuff ()
  (interactive)
  (menu-bar-mode -1))

(add-hook 'window-setup-hook 'post-load-stuff t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Load configuration modules
(load-user-file "packages.el")
(load-user-file "evil.el")
(load-user-file "neotree.el")
(load-user-file "helm.el")
;:(load-user-file "source-edit.el")
(load-user-file "compile.el")
(load-user-file "keymap.el")
(load-user-file "misc.el")
(load-user-file "cmake.el")
(load-user-file "org-setup.el")
(load-user-file "appearance.el")
(load-user-file "editing.el")

(setq shift-select-mode nil)
(setq enable-local-variables nil)

