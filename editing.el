; Stop Emacs from losing undo information by
; setting very high limits for undo buffers
(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq large-file-warning-threshold nil)

; Turn off the bell on Mac OS X
(defun nil-bell ())
(setq ring-bell-function 'nil-bell)

(global-hl-line-mode 1)

; no screwing with my middle mouse button
(global-unset-key [mouse-2])

; Smooth scroll
(setq scroll-step 3)

; Clock
(display-time)

