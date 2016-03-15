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

(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-style (quote (spaces face tabs space-mark tab-mark)))
(set-face-attribute 'whitespace-space nil :background (face-background 'default) :foreground "DimGrey")
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [182 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))


(defun swap-meta-and-super ()
  "Swap the mapping of meta and super. Very useful for people using their Mac
with a Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier 'super)
      (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))

(global-set-key (kbd "C-c w w") 'swap-meta-and-super)

(defun untab-save-buffer ()
  "Save the buffer after untabifying it."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (untabify (point-min) (point-max))))
  (save-buffer))

(global-set-key (kbd "\eu") 'untab-save-buffer)

