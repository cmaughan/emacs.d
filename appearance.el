
; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

; No toolbar
(tool-bar-mode -1)

; Get rid of the butt ugly OSX scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

; Set cursor colors depending on mode
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
)

; Use solarized dark (in GUI)
(when (display-graphic-p) (load-theme 'solarized-dark t))
