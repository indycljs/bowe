;; These customizations change the way emacs looks and disable/enable
;; some user interface elements. Some useful customizations are
;; commented out, and begin with the line "CUSTOMIZE". These are more
;; a matter of preference and may require some fiddling to match your
;; preferences

;; Turn off the menu bar at the top of each frame because it's distracting
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Show line numbers
(global-linum-mode)

;; You can uncomment this to remove the graphical toolbar at the top. After
;; awhile, you won't need the toolbar.
;; (when (fboundp 'tool-bar-mode)
;;   (tool-bar-mode -1))

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

;; Color Themes
;; Read http://batsov.com/articles/2012/02/19/color-theming-in-emacs-reloaded/
;; for a great explanation of emacs color themes.
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Custom-Themes.html
;; for a more technical explanation.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
(load-theme 'tomorrow-night-bright t)

;; increase font size for better readability
;; changed to 100 from 120 since I need more space
;(set-face-attribute 'default nil :height 120)

(set-face-attribute 'default nil :family "Inconsolata LGC" :height 120)
(set-face-attribute 'mode-line nil :family "Terminus" :height 100)
(set-face-attribute 'mode-line-buffer-id nil :family "Terminus" :height 100)
(set-face-attribute 'mode-line-emphasis nil :family "Terminus" :height 100)
(set-face-attribute 'mode-line-highlight nil :family "Terminus" :height 100)
(set-face-attribute 'mode-line-inactive nil :family "Terminus" :height 100 :background "#111")
(set-face-attribute 'minibuffer-prompt nil :family "Terminus" :height 100)

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it
;; (setq initial-frame-alist '((top . 0) (left . 0) (width . 177) (height . 53)))

;; These settings relate to how emacs interacts with your operating system
(setq ;; makes killing/yanking interact with the clipboard
      x-select-enable-clipboard t

      ;; I'm actually not sure what this does but it's recommended?
      x-select-enable-primary t

      ;; Save clipboard strings into kill ring before replacing them.
      ;; When one selects something in another program to paste it into Emacs,
      ;; but kills something in Emacs before actually pasting it,
      ;; this selection is gone unless this variable is non-nil
      save-interprogram-paste-before-kill t

      ;; Shows all options when running apropos. For more info,
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
      apropos-do-all t

      ;; Mouse yank commands yank at point instead of at click.
      mouse-yank-at-point t)

;; No cursor blinking, it's distracting
(blink-cursor-mode 0)

;; full path in title bar
(setq-default frame-title-format "%b (%f)")

;; don't pop up font menu
(global-set-key (kbd "s-t") '(lambda () (interactive)))

;; no bell
(setq ring-bell-function 'ignore)

;; transparency!
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(setq-default line-spacing 1)

(winner-mode 1)
(workgroups-mode 1)

(win-switch-setup-keys-ijkl "\C-xo")
;(win-switch-set-keys-arrow-ctrl 1)
(setq win-switch-idle-time 3)

;; These two lines are just examples
;; (setq powerline-arrow-shape 'curve)
;; (setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'dark)
(sml/setup)

;(let ((faces '(mode-line
               ;mode-line-buffer-id
               ;mode-line-emphasis
               ;mode-line-highlight
               ;mode-line-inactive)))
     ;(mapc
      ;(lambda (face) 
       ;faces))

(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

(add-to-list 'after-make-frame-functions (lambda (frame)
  (with-selected-frame frame
    (set-face-attribute 'fringe nil :background nil)
    (set-face-attribute 'linum nil :background nil :foreground "#888" :height 110)
    (with-current-buffer (get-buffer " *Echo Area 0*")
       (setq-local face-remapping-alist '((default (:family "Terminus" :height 100))))))))

(add-hook 'minibuffer-setup-hook
  (lambda ()
    (make-local-variable 'face-remapping-alist)
    (add-to-list 'face-remapping-alist '(default (:family "Terminus" :height 100)))))

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)
