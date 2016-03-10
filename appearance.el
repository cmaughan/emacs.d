; Don't display the ugly startup message (particularly ugly in the GUI)
;:w(setq inhibit-startup-message t)

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

; Bright-red TODOs
 (setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
 (make-face 'font-lock-fixme-face)
 (make-face 'font-lock-study-face)
 (make-face 'font-lock-important-face)
 (make-face 'font-lock-note-face)
 (mapc (lambda (mode)
	 (font-lock-add-keywords
	  mode
	  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	    ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
	    ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
            ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
	fixme-modes)
 (modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
 (modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
 (modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
 (modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)


(defun cmaughan-never-split-a-window
    "Never, ever split a window.  Why would anyone EVER want you to do that??"
    nil)
(setq split-window-preferred-function 'cmaughan-never-split-a-window)


;       (current-line . "#282a2e")
;              (selection . "#373b41")
;              (foreground . "#c5c8c6")
;              (comment . "#969896")
;              (red . "#cc6666")
;              (orange . "#de935f")
;              (yellow . "#f0c674")
;              (green . "#b5bd68")
;              (aqua . "#8abeb7")
;              (blue . "#81a2be")
;              (purple . "#b294bb")))

(set-face-attribute 'font-lock-builtin-face nil :foreground "CornflowerBlue")      ; built in functions
(set-face-attribute 'font-lock-comment-face nil :foreground "OliveDrab")
(set-face-attribute 'font-lock-constant-face nil :foreground "Yellow")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")      
(set-face-attribute 'font-lock-function-name-face nil :foreground "#cb4b16")  
(set-face-attribute 'font-lock-keyword-face nil :foreground "CornflowerBlue")
(set-face-attribute 'font-lock-string-face nil :foreground "DarkSalmon")
(set-face-attribute 'font-lock-type-face nil :foreground "CornflowerBlue")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "DarkSalmon") ; 'int _foo_
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "lightgrey")

(set-foreground-color "PapayaWhip")
(set-background-color "#181818")
(set-cursor-color "#40FF40")

(scroll-bar-mode -1)

; Turn off the toolbar
(tool-bar-mode 0)


(defun maximize-frame ()
    "Maximize the current frame"
    (interactive)
    (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(maximize-frame)

; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

(global-hl-line-mode 1)
(set-face-background 'hl-line "midnight blue")
