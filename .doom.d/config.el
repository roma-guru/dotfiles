;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Roman Voropaev"
      user-mail-address "voropaev.roma@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;;
;; TODO: dark theme in the evening
(setq doom-theme 'doom-solarized-light)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(map! :nv "-" 'dired-jump)
(map! :nv "C-<up>" 'evil-window-up)
(map! :nv "C-<down>" 'evil-window-down)
(map! :nv "C-<left>" 'evil-window-left)
(map! :nv "C-<right>" 'evil-window-right)
(map! :nv "C-c" 'evil-window-delete)
(map! :nv "C-a" 'evil-numbers/inc-at-pt)
(map! :nv "C-S-a" 'evil-numbers/dec-at-pt)

;; Org-mode imprvmnts
(after! org
  (map! :map org-mode-map
        :n "M-j" 'org-metadown
        :n "M-k" 'org-metaup))

(setq projectile-project-search-path '("~/Desktop"))
(setq default-directory "~/Desktop")

;; I hate autoclosing things
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

;; Go path
(setenv "PATH" (concat "/home/roma/go/bin:" (getenv "PATH")))

;; Make Home not a project but great place
(after! projectile (setq projectile-project-root-files-bottom-up (remove
            ".git" projectile-project-root-files-bottom-up)))

;; Word wrap by default
(global-visual-line-mode t)
;; Disable noisy current line
(setq global-hl-line-modes nil)

;; Disable copying each edit into clipboard, that's stupid!
(setq select-enable-clipboard nil)
(map! :v "M-s-c" 'clipboard-kill-ring-save)
(map! :ni "M-s-v" 'clipboard-yank)
