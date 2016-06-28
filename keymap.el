;; Global key bindings

(use-package key-chord :ensure key-chord)
;(define-key global-map "\t" 'dabbrev-expand)
;(define-key global-map [S-tab] 'indent-for-tab-command)
;(define-key global-map [backtab] 'indent-for-tab-command)
;(define-key global-map "\C-y" 'indent-for-tab-command)
;(define-key global-map [C-tab] 'indent-region)
;(define-key global-map "	" 'indent-region)

(define-key global-map "\ep" 'quick-calc)
(define-key global-map "\ew" 'other-window)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

; Navigation
;(defun previous-blank-line ()
;  "Moves to the previous line containing nothing but whitespace."
;  (interactive)
;  (search-backward-regexp "^[ \t]*\n")
;)

;(defun next-blank-line ()
;  "Moves to the next line containing nothing but whitespace."
;  (interactive)
;  (forward-line)
;  (search-forward-regexp "^[ \t]*\n")
;  (forward-line -1)
;)

;(define-key global-map [C-up] 'previous-blank-line)
;(define-key global-map [C-down] 'next-blank-line)
;(define-key global-map [home] 'beginning-of-line)
;(define-key global-map [end] 'end-of-line)
;(define-key global-map [pgup] 'forward-page)
;(define-key global-map [pgdown] 'backward-page)
;(define-key global-map [C-next] 'scroll-other-window)
;(define-key global-map [C-prior] 'scroll-other-window-down)

; ALT-alternatives
(defadvice set-mark-command (after no-bloody-t-m-m activate)
  "Prevent consecutive marks activating bloody `transient-mark-mode'."
  (if transient-mark-mode (setq transient-mark-mode nil)))

(defadvice mouse-set-region-1 (after no-bloody-t-m-m activate)
  "Prevent mouse commands activating bloody `transient-mark-mode'."
  (if transient-mark-mode (setq transient-mark-mode nil))) 

(defun append-as-kill ()
  "Performs copy-region-as-kill as an append."
  (interactive)
  (append-next-kill) 
  (copy-region-as-kill (mark) (point))
)
;(define-key global-map "\e " 'set-mark-command)
(define-key global-map "\eq" 'append-as-kill)
;(define-key global-map "\ea" 'yank)
;(define-key global-map "\ez" 'kill-region)
;(define-key global-map [M-up] 'previous-blank-line)
;(define-key global-map [M-down] 'next-blank-line)
;(define-key global-map [M-right] 'forward-word)
;(define-key global-map [M-left] 'backward-word)

;(define-key global-map "\e:" 'View-back-to-mark)
;(define-key global-map "\e;" 'exchange-point-and-mark)

(define-key global-map [f9] 'first-error)
(define-key global-map [f10] 'previous-error)
(define-key global-map [f11] 'next-error)

(define-key global-map "\en" 'next-error)
(define-key global-map "\eN" 'previous-error)

(define-key global-map "\eg" 'goto-line)
(define-key global-map "\ej" 'imenu)

; Editting
;(define-key global-map "" 'copy-region-as-kill)
;(define-key global-map "" 'yank)
;(define-key global-map "" 'nil)
;(define-key global-map "" 'rotate-yank-pointer)
;(define-key global-map "\eu" 'undo)
;(define-key global-map "\e6" 'upcase-word)
;(define-key global-map "\e^" 'captilize-word)
;(define-key global-map "\e." 'fill-paragraph)

;(defun casey-replace-in-region (old-word new-word)
;  "Perform a replace-string in the current region."
;  (interactive "sReplace: \nsReplace: %s  With: ")
;  (save-excursion (save-restriction
;		    (narrow-to-region (mark) (point))
;		    (beginning-of-buffer)
;		    (replace-string old-word new-word)
;		    ))
 ; )
;(define-key global-map "\el" 'casey-replace-in-region)

;(define-key global-map "\eo" 'query-replace)
;(define-key global-map "\eO" 'casey-replace-string)

; \377 is alt-backspace
;(define-key global-map "\377" 'backward-kill-word)
;(define-key global-map [M-delete] 'kill-word)

;(define-key global-map "\e[" 'start-kbd-macro)
;(define-key global-map "\e]" 'end-kbd-macro)
;(define-key global-map "\e'" 'call-last-kbd-macro)

; Buffers
;(define-key global-map "\er" 'revert-buffer)
;(define-key global-map "\ek" 'kill-this-buffer)

;(define-key global-map "\es" 'save-buffer)

