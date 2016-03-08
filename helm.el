(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-autoresize-max-height            40 
      helm-autoresize-min-height            40
      helm-M-x-fuzzy-match                  t)

(helm-autoresize-mode t)

(helm-mode 1)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-x") 'helm-M-x)

; Setup my find-files
(define-key global-map "\ef" 'helm-find-files)

(defun helm-find-file-other-window ()
  "Find other File"
  (interactive)
  (setq thisdir '(file-name-directory load-file-name))
  (info 'thisdir)
  (other-window 1)
  (call-interactively '(helm-find-files 'thisdir)))

(define-key global-map "\eF" 'helm-find-file-other-window)


;(require 'ido)
;(global-set-key (read-kbd-macro "\eb")  'ido-switch-buffer)
;(global-set-key (read-kbd-macro "\eB")  'ido-switch-buffer-other-window)
;(ido-mode t)
