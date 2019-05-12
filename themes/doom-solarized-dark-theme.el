;;; doom-solarized-dark-theme.el --- inspired by Atom One Dark
(add-to-list 'custom-theme-load-path "~/solarized/emacs-colors-solarized")
(require 'doom-themes)

;;
(defgroup doom-solarized-dark-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-solarized-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-comment-bg doom-solarized-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-solarized-dark-theme
  :type 'boolean)

(defcustom doom-solarized-dark-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-solarized-dark-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-solarized-dark
  "A dark theme inspired by Solarized dark"

  ;; name        default   256       16
  ((bg         '("#002b36" nil       nil            ))
   (bg-alt     '("#073642" nil       nil            ))
   (base0      '("#586e75" "black"   "brightgreen"  ))
   (base1      '("#657b83" "#1e1e1e" "brightyellow" ))
   (base2      '("#839496" "#2e2e2e" "brightblue"   ))
   (base3      '("#93a1a1" "#073642" "brightcyan"   ))
   (base4      '("#eee8d5" "#3f3f3f" "white"  ))
   (base5      '("#fdf6e3" "#525252" "brightblack"  ))
   (base6      '("#586e75" "#6b6b6b" "brightblack"  ))
   (base7      '("#cb4b16" "#979797" "brightblack"  ))
   (base8      '("#073642" "#dfdfdf" "white"        ))
   (fg         '("#839496" "#2d2d2d" "brightblue"   ))
   (fg-alt     '("#93a1a1" "#bfbfbf" "brightcyan"   ))

   (grey       base4)
   (red        '("#dc322f" "#ff6655" "red"          ))
   (orange     '("#cb4b16" "#dd8844" "brightred"    ))
   (green      '("#859900" "#99bb66" "green"        ))
   (teal       '("#35a69c" "#33aa99" "brightgreen"  ))
   (yellow     '("#b58900" "#ECBE7B" "yellow"       ))
   (blue       '("#268bd2" "#51afef" "brightblue"   ))
   (dark-blue  '("#E1E3E5" "#2257A0" "blue"         ))
   (magenta    '("#d33682" "#c678dd" "magenta"      ))
   (violet     '("#6c71c4" "#a9a1e1" "brightmagenta"))
   (cyan       '("#2aa198" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#D7DDD7" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      fg-alt)
   (vertical-bar   base4)
   (selection      bg-alt)
   (builtin        magenta)
   (comments       (if doom-solarized-dark-brighter-comments
                       (doom-darken teal 0.25)
                     base6))
   (doc-comments   teal)
   (constants      violet)
   (functions      magenta)
   (keywords       green)
   (methods        cyan)
   (operators      blue)
   (type           yellow)
   (strings        cyan)
   (variables      blue)
   (numbers        violet)
   (cursor         `(,(doom-lighten (car fg) 0.3) ,@(doom-lighten (cdr base6) 0.1)))
   (region         `(,(doom-lighten (car bg-alt) 0.1) ,@(doom-lighten (cdr base0) 0.1)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-solarized-dark-brighter-modeline)
   (-modeline-pad
    (when doom-solarized-dark-padded-modeline
      (if (integerp doom-solarized-dark-padded-modeline) doom-solarized-dark-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base3)

   (modeline-bg
    (if -modeline-bright
        (doom-darken bg 0.7)
      (doom-darken base0 0.2)))
   (modeline-bg-l
    (if -modeline-bright
        (doom-darken bg 0.7)
      (doom-darken bg 0.05)))
   (modeline-bg-inactive   (doom-lighten bg 0.02))
   (modeline-bg-inactive-l (doom-lighten bg 0.025)))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; (hl-line :background bg-alt)

   ((line-number &override) :foreground base6)
   ((line-number-current-line &override) :foreground fg :background region :weight 'bold)

   (org-block :background (doom-blend yellow bg 0.04))
   (org-block-background :background (doom-blend yellow bg 0.04))
   (org-block-begin-line :background (doom-blend yellow bg 0.08))
   (org-block-end-line :background (doom-blend yellow bg 0.08))
   (font-lock-comment-face
    :slant 'italic
    :foreground comments
    :background (if doom-solarized-dark-comment-bg (doom-blend teal base0 0.07)))
   ((font-lock-doc-face &override) :foreground doc-comments)
   ((font-lock-type-face &override) :slant 'italic)
   ((font-lock-builtin-face &override) :slant 'italic)
   ((font-lock-function-name-face &override) :foreground type)


   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-code-face :background (doom-darken base3 0.05))

   ;; ivy-mode
   (ivy-current-match :background (doom-darken yellow 0.65) :distant-foreground fg)
   (ivy-minibuffer-match-face-1
    :foreground comments
    :weight 'light)
   (ivy-minibuffer-match-face-2 :foreground magenta :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-3 :foreground green   :background base3 :weight 'bold)
   (ivy-minibuffer-match-face-4 :foreground yellow  :background base3 :weight 'bold)
   (ivy-minibuffer-match-highlight :foreground violet :weight 'bold)

   ;; posframe
   (ivy-posframe :background modeline-bg-l)
   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)


   (evil-ex-search :background orange :foreground bg :weight 'bold)
   (tooltip :background base4 :foreground base1 :weight 'bold)
   (company-tooltip-search :background base4 :foreground bg :weight 'bold)
   ;; (lazy-highlight ((t (:background fg-alt :foreground bg :weight bold))))
   ;; (lsp-face-highlight-read ((t (:background fg-alt :foreground bg :weight bold))))
   ;; (lsp-face-highlight-textual ((t (:background fg-alt :foreground bg :weight bold))))
   ;; (lsp-face-highlight-write ((t (:background fg-alt :foreground bg :weight bold))))

   )

  ;; --- extra variables ---------------------
  ;; ()
  )

;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.

;;; doom-solarized-dark-theme.el ends here
