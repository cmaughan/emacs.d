
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
(add-to-list 'projectile-globally-ignored-files "*.png")
(add-to-list 'projectile-globally-ignored-files "*.bmp")
(add-to-list 'projectile-globally-ignored-files "*.pdb")
(add-to-list 'projectile-globally-ignored-files "*.obj")
(add-to-list 'projectile-globally-ignored-files "*.lib")
(add-to-list 'projectile-globally-ignored-files "build")
(add-to-list 'projectile-globally-ignored-files "bin")


(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)

;(when (executable-find "ack")
;  (setq helm-grep-default-command "ack -Hn --no-group --no-color %e %p %f"
;	helm-grep-default-recurse-command "ack -H --no-group --no-color %e %p %f"))

(defun smart-find-file()
  "Call `helm-projectile' if `projectile-project-p', otherwise
fallback to `helm-for-files'."
  (interactive)
  (if (projectile-project-p)
      (helm-projectile-find-file)
    (helm-find-files nil)))

(defun smart-find-file-other-window()
  "Call `helm-projectile' if `projectile-project-p', otherwise
fallback to `helm-for-files'."
  (interactive)
  (other-window 1)
  (if (projectile-project-p)
      (helm-projectile-find-file)
    (helm-find-files nil)))

(defun helm-find-files-other-window()
  "Call helm find file in other window"
  (interactive)
  (other-window 1)
  (helm-find-files nil))

; Setup my find-files
; Shift F find files in other window
(define-key global-map "\ef" 'helm-find-files)
(define-key global-map "\eF" 'helm-find-files-other-window)

; Default find is helm
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(custom-set-variables
 '(helm-follow-mode-persistent t)
 '(helm-ag-base-command "pt --nocolor --nogroup")
)

(require 'helm-ag)
