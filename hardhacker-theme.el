;; This code is copied from the dracula/emacs, which is licensed under the MIT License.
;; See the licenses/MIT-LICENSE file in this project for more information on the MIT License.
;;
;; Copyright 2015-present, All rights reserved
;;
;; This code is licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;;      http://www.apache.org/licenses/LICENSE-2.0


;;; HardHacker Emacs Theme

(deftheme hardhacker)


;;;; Configuration options:

(defgroup hardhacker nil
  "hardhacker theme options.

The theme has to be reloaded after changing anything in this group."
  :group 'faces)

(defcustom hardhacker-enlarge-headings t
  "Use different font sizes for some headings and titles."
  :type 'boolean
  :group 'hardhacker)

(defcustom hardhacker-height-title-1 1.3
  "Font size 100%."
  :type 'number
  :group 'hardhacker)

(defcustom hardhacker-height-title-2 1.1
  "Font size 110%."
  :type 'number
  :group 'hardhacker)

(defcustom hardhacker-height-title-3 1.0
  "Font size 130%."
  :type 'number
  :group 'hardhacker)

(defcustom hardhacker-height-doc-title 1.44
  "Font size 144%."
  :type 'number
  :group 'hardhacker)

(defcustom hardhacker-alternate-mode-line-and-minibuffer nil
  "Use less bold and pink in the minibuffer."
  :type 'boolean
  :group 'hardhacker)

(defvar hardhacker-use-24-bit-colors-on-256-colors-terms nil
  "Use true colors even on terminals announcing less capabilities.

Beware the use of this variable.  Using it may lead to unwanted
behavior, the most common one being an ugly blue background on
terminals, which don't understand 24 bit colors.  To avoid this
blue background, when using this variable, one can try to add the
following lines in their config file after having load the
hardhacker theme:

    (unless (display-graphic-p)
      (set-face-background 'default \"black\" nil))

There is a lot of discussion behind the 256 colors theme (see URL
`https://github.com/hardhacker/emacs/pull/57').  Please take time to
read it before opening a new issue about your will.")


;;;; Theme definition:

;; Assigment form: VARIABLE COLOR [256-COLOR [TTY-COLOR]]
(let ((colors '(;; Upstream theme color
                (hardhacker-bg          "#282433" "#262626" "unspecified-bg") ; background
                (hardhacker-fg          "#eee9fc" "#eeeeee" "brightwhite") ; foreground
                (hardhacker-selection   "#3f3951" "#444444" "brightblack") ; selection
                (hardhacker-comment     "#938aad" "#767676" "grey")        ; comment
                (hardhacker-cyan        "#b3f4f3" "#87ffff" "brightcyan")  ; cyan
                (hardhacker-green       "#b1f2a7" "#afffaf" "green")       ; green
                (hardhacker-blue        "#b1baf4" "#afd7ff" "magenta")     ; blue
                (hardhacker-purple      "#e192ef" "#ffafff" "brightmagenta") ; purple
                (hardhacker-red         "#e965a5" "#ff5faf" "red")         ; red
                (hardhacker-yellow      "#ebde76" "#ffff5f" "yellow")      ; yellow
                ;; Other colors
                (bg2             "#282433" "#121212" "brightblack")
                (bg3             "#282433" "#444444" "brightblack")
                (fg2             "#eee9fc" "#e4e4e4" "brightwhite")
                (fg3             "#eee9fc" "#c6c6c6" "white")
                (fg4             "#eee9fc" "#b2b2b2" "white")))
      (faces '(;; default / basic faces
               (cursor :background ,hardhacker-fg)
               (default :background ,hardhacker-bg :foreground ,hardhacker-fg)
               (default-italic :slant italic)
               (error :foreground ,hardhacker-red)
               (ffap :foreground ,fg4)
               (fringe :background ,hardhacker-bg :foreground ,fg4)
               (header-line :inherit 'mode-line)
               (highlight :foreground ,hardhacker-fg :background ,hardhacker-selection)
               (hl-line :background ,hardhacker-selection :extend t)
               (info-quoted-name :foreground ,hardhacker-yellow)
               (info-string :foreground ,hardhacker-yellow)
               (lazy-highlight :foreground ,fg2 :background ,bg2)
               (link :foreground ,hardhacker-cyan :underline t)
               (linum :foreground ,hardhacker-comment :background ,hardhacker-bg)
               (line-number :foreground ,hardhacker-comment :background ,hardhacker-bg)
               (match :background ,hardhacker-yellow :foreground ,hardhacker-bg)
               (menu :background ,hardhacker-selection :inverse-video nil
                     ,@(if hardhacker-alternate-mode-line-and-minibuffer
                           (list :foreground fg3)
                         (list :foreground hardhacker-fg)))
               (minibuffer-prompt
                ,@(if hardhacker-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground hardhacker-fg)
                    (list :weight 'bold :foreground hardhacker-red)))
               (mode-line :background ,hardhacker-selection
                          :box ,hardhacker-selection :inverse-video nil
                          ,@(if hardhacker-alternate-mode-line-and-minibuffer
                                (list :foreground fg3)
                              (list :foreground hardhacker-fg)))
               (mode-line-inactive
                :background ,hardhacker-bg :inverse-video nil
                ,@(if hardhacker-alternate-mode-line-and-minibuffer
                      (list :foreground hardhacker-comment :box hardhacker-bg)
                    (list :foreground fg4 :box bg2)))
               (read-multiple-choice-face :inherit completions-first-difference)
               (region :inherit match :extend t)
               (shadow :foreground ,hardhacker-comment)
               (success :foreground ,hardhacker-green)
               (tooltip :foreground ,hardhacker-fg :background ,hardhacker-selection)
               (trailing-whitespace :background ,hardhacker-yellow)
               (vertical-border :foreground ,bg2)
               (warning :foreground ,hardhacker-yellow)
               ;; syntax / font-lock
               (font-lock-builtin-face :foreground ,hardhacker-cyan)
               (font-lock-comment-face :foreground ,hardhacker-comment :slant italic)
               (font-lock-comment-delimiter-face :foreground ,hardhacker-comment :slant italic)
               (font-lock-constant-face :foreground ,hardhacker-purple)
               (font-lock-doc-face :foreground ,hardhacker-comment)
               (font-lock-function-name-face :foreground ,hardhacker-red)
               (font-lock-keyword-face :foreground ,hardhacker-blue)
               (font-lock-negation-char-face :foreground ,hardhacker-cyan)
               (font-lock-number-face :foreground ,hardhacker-yellow)
               (font-lock-operator-face :foreground ,hardhacker-fg)
               (font-lock-preprocessor-face :foreground ,hardhacker-purple)
               (font-lock-reference-face :inherit font-lock-constant-face) ;; obsolete
               (font-lock-regexp-grouping-backslash :foreground ,hardhacker-cyan)
               (font-lock-regexp-grouping-construct :foreground ,hardhacker-purple)
               (font-lock-string-face :foreground ,hardhacker-green)
               (font-lock-type-face :foreground ,hardhacker-cyan)
               (font-lock-variable-name-face :foreground ,hardhacker-purple)
               (font-lock-warning-face :inherit warning :background ,bg2)
               ;; auto-complete
               (ac-completion-face :underline t :foreground ,hardhacker-blue)
               ;; bookmarks
               (bookmark-face :foreground ,hardhacker-blue)
               ;; company
               (company-echo-common :foreground ,hardhacker-bg :background ,hardhacker-fg)
               (company-preview :background ,hardhacker-selection :foreground ,hardhacker-blue)
               (company-preview-common :inherit company-preview
                                       :foreground ,hardhacker-blue)
               (company-preview-search :inherit company-preview
                                       :foreground ,hardhacker-green)
               (company-scrollbar-bg :background ,hardhacker-comment)
               (company-scrollbar-fg :foreground ,hardhacker-blue)
               (company-tooltip :inherit tooltip)
               (company-tooltip-search :foreground ,hardhacker-green
                                       :underline t)
               (company-tooltip-search-selection :background ,hardhacker-green
                                                 :foreground ,hardhacker-bg)
               (company-tooltip-selection :inherit match)
               (company-tooltip-mouse :background ,hardhacker-bg)
               (company-tooltip-common :foreground ,hardhacker-blue :weight bold)
               ;;(company-tooltip-common-selection :inherit company-tooltip-common)
               (company-tooltip-annotation :foreground ,hardhacker-cyan)
               ;;(company-tooltip-annotation-selection :inherit company-tooltip-annotation)
               ;; completions (minibuffer.el)
               (completions-annotations :inherit font-lock-comment-face)
               (completions-common-part :foreground ,hardhacker-green)
               (completions-first-difference :foreground ,hardhacker-blue :weight bold)
               ;; diff
               (diff-added :background ,hardhacker-selection :foreground ,hardhacker-green :extend t)
               (diff-removed :background ,hardhacker-selection :foreground ,hardhacker-red :extend t)
               (diff-refine-added :background ,hardhacker-selection
                                  :foreground ,hardhacker-green)
               (diff-refine-removed :background ,hardhacker-selection
                                    :foreground ,hardhacker-red)
               (diff-indicator-added :foreground ,hardhacker-green)
               (diff-indicator-removed :foreground ,hardhacker-red)
               (diff-indicator-changed :foreground ,hardhacker-yellow)
               (diff-error :foreground ,hardhacker-red, :background ,hardhacker-bg
                           :weight bold)
               ;; diff-hl
               (diff-hl-change :foreground ,hardhacker-yellow :background ,hardhacker-selection)
               (diff-hl-delete :foreground ,hardhacker-red :background ,hardhacker-selection)
               (diff-hl-insert :foreground ,hardhacker-green :background ,hardhacker-selection)
               ;; dired
               (dired-directory :foreground ,hardhacker-green :weight normal)
               (dired-flagged :foreground ,hardhacker-blue)
               (dired-header :foreground ,fg3 :background ,hardhacker-bg)
               (dired-ignored :inherit shadow)
               (dired-mark :foreground ,hardhacker-fg :weight bold)
               (dired-marked :foreground ,hardhacker-yellow :weight bold)
               (dired-perm-write :foreground ,fg3 :underline t)
               (dired-symlink :foreground ,hardhacker-yellow :weight normal :slant italic)
               (dired-warning :foreground ,hardhacker-yellow :underline t)
               (diredp-compressed-file-name :foreground ,fg3)
               (diredp-compressed-file-suffix :foreground ,fg4)
               (diredp-date-time :foreground ,hardhacker-fg)
               (diredp-deletion-file-name :foreground ,hardhacker-blue :background ,hardhacker-selection)
               (diredp-deletion :foreground ,hardhacker-blue :weight bold)
               (diredp-dir-heading :foreground ,fg2 :background ,bg3)
               (diredp-dir-name :inherit dired-directory)
               (diredp-dir-priv :inherit dired-directory)
               (diredp-executable-tag :foreground ,hardhacker-yellow)
               (diredp-file-name :foreground ,hardhacker-fg)
               (diredp-file-suffix :foreground ,fg4)
               (diredp-flag-mark-line :foreground ,fg2 :slant italic :background ,hardhacker-selection)
               (diredp-flag-mark :foreground ,fg2 :weight bold :background ,hardhacker-selection)
               (diredp-ignored-file-name :foreground ,hardhacker-fg)
               (diredp-mode-line-flagged :foreground ,hardhacker-yellow)
               (diredp-mode-line-marked :foreground ,hardhacker-yellow)
               (diredp-no-priv :foreground ,hardhacker-fg)
               (diredp-number :foreground ,hardhacker-cyan)
               (diredp-other-priv :foreground ,hardhacker-yellow)
               (diredp-rare-priv :foreground ,hardhacker-yellow)
               (diredp-read-priv :foreground ,hardhacker-purple)
               (diredp-write-priv :foreground ,hardhacker-blue)
               (diredp-exec-priv :foreground ,hardhacker-yellow)
               (diredp-symlink :foreground ,hardhacker-yellow)
               (diredp-link-priv :foreground ,hardhacker-yellow)
               (diredp-autofile-name :foreground ,hardhacker-yellow)
               (diredp-tagged-autofile-name :foreground ,hardhacker-yellow)
               ;; ediff
               (ediff-current-diff-A :background ,hardhacker-red)
               (ediff-fine-diff-A :background ,hardhacker-red :foreground ,hardhacker-fg)
               (ediff-current-diff-B :background ,hardhacker-green)
               (ediff-fine-diff-B :background ,hardhacker-green :foreground ,hardhacker-bg)
               (ediff-current-diff-C :background ,hardhacker-blue)
               (ediff-fine-diff-C :background ,hardhacker-cyan :foreground ,hardhacker-bg)
               ;; eglot
               (eglot-diagnostic-tag-unnecessary-face :inherit warning)
               (eglot-diagnostic-tag-deprecated-face :inherit warning :strike-through t)
               ;; eldoc-box
               (eldoc-box-border :background ,hardhacker-selection)
               (eldoc-box-body :background ,hardhacker-selection)
               ;; elfeed
               (elfeed-search-date-face :foreground ,hardhacker-comment)
               (elfeed-search-title-face :foreground ,hardhacker-fg)
               (elfeed-search-unread-title-face :foreground ,hardhacker-blue :weight bold)
               (elfeed-search-feed-face :foreground ,hardhacker-fg :weight bold)
               (elfeed-search-tag-face :foreground ,hardhacker-green)
               (elfeed-search-last-update-face :weight bold)
               (elfeed-search-unread-count-face :foreground ,hardhacker-blue)
               (elfeed-search-filter-face :foreground ,hardhacker-green :weight bold)
               ;;(elfeed-log-date-face :inherit font-lock-type-face)
               (elfeed-log-error-level-face :foreground ,hardhacker-red)
               (elfeed-log-warn-level-face :foreground ,hardhacker-yellow)
               (elfeed-log-info-level-face :foreground ,hardhacker-cyan)
               (elfeed-log-debug-level-face :foreground ,hardhacker-comment)
               ;; elpher
               (elpher-gemini-heading1 :inherit bold :foreground ,hardhacker-blue
                                       ,@(when hardhacker-enlarge-headings
                                           (list :height hardhacker-height-title-1)))
               (elpher-gemini-heading2 :inherit bold :foreground ,hardhacker-purple
                                       ,@(when hardhacker-enlarge-headings
                                           (list :height hardhacker-height-title-2)))
               (elpher-gemini-heading3 :weight normal :foreground ,hardhacker-green
                                       ,@(when hardhacker-enlarge-headings
                                           (list :height hardhacker-height-title-3)))
               (elpher-gemini-preformatted :inherit fixed-pitch
                                           :foreground ,hardhacker-yellow)
               ;; enh-ruby
               (enh-ruby-heredoc-delimiter-face :foreground ,hardhacker-yellow)
               (enh-ruby-op-face :foreground ,hardhacker-blue)
               (enh-ruby-regexp-delimiter-face :foreground ,hardhacker-green)
               (enh-ruby-string-delimiter-face :foreground ,hardhacker-green)
               ;; flyspell
               (flyspell-duplicate :underline (:style wave :color ,hardhacker-yellow))
               (flyspell-incorrect :underline (:style wave :color ,hardhacker-red))
               ;; font-latex
               (font-latex-bold-face :foreground ,hardhacker-purple)
               (font-latex-italic-face :foreground ,hardhacker-blue :slant italic)
               (font-latex-match-reference-keywords :foreground ,hardhacker-cyan)
               (font-latex-match-variable-keywords :foreground ,hardhacker-fg)
               (font-latex-string-face :foreground ,hardhacker-yellow)
               ;; gemini
               (gemini-heading-face-1 :inherit bold :foreground ,hardhacker-blue
                                      ,@(when hardhacker-enlarge-headings
                                          (list :height hardhacker-height-title-1)))
               (gemini-heading-face-2 :inherit bold :foreground ,hardhacker-purple
                                      ,@(when hardhacker-enlarge-headings
                                          (list :height hardhacker-height-title-2)))
               (gemini-heading-face-3 :weight normal :foreground ,hardhacker-green
                                      ,@(when hardhacker-enlarge-headings
                                          (list :height hardhacker-height-title-3)))
               (gemini-heading-face-rest :weight normal :foreground ,hardhacker-yellow)
               (gemini-quote-face :foreground ,hardhacker-purple)
               ;; go-test
               (go-test--ok-face :inherit success)
               (go-test--error-face :inherit error)
               (go-test--warning-face :inherit warning)
               (go-test--pointer-face :foreground ,hardhacker-blue)
               (go-test--standard-face :foreground ,hardhacker-cyan)
               ;; gnus-group
               (gnus-group-mail-1 :foreground ,hardhacker-blue :weight bold)
               (gnus-group-mail-1-empty :inherit gnus-group-mail-1 :weight normal)
               (gnus-group-mail-2 :foreground ,hardhacker-cyan :weight bold)
               (gnus-group-mail-2-empty :inherit gnus-group-mail-2 :weight normal)
               (gnus-group-mail-3 :foreground ,hardhacker-comment :weight bold)
               (gnus-group-mail-3-empty :inherit gnus-group-mail-3 :weight normal)
               (gnus-group-mail-low :foreground ,hardhacker-selection :weight bold)
               (gnus-group-mail-low-empty :inherit gnus-group-mail-low :weight normal)
               (gnus-group-news-1 :foreground ,hardhacker-blue :weight bold)
               (gnus-group-news-1-empty :inherit gnus-group-news-1 :weight normal)
               (gnus-group-news-2 :foreground ,hardhacker-cyan :weight bold)
               (gnus-group-news-2-empty :inherit gnus-group-news-2 :weight normal)
               (gnus-group-news-3 :foreground ,hardhacker-comment :weight bold)
               (gnus-group-news-3-empty :inherit gnus-group-news-3 :weight normal)
               (gnus-group-news-4 :inherit gnus-group-news-low)
               (gnus-group-news-4-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-5 :inherit gnus-group-news-low)
               (gnus-group-news-5-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-6 :inherit gnus-group-news-low)
               (gnus-group-news-6-empty :inherit gnus-group-news-low-empty)
               (gnus-group-news-low :foreground ,hardhacker-selection :weight bold)
               (gnus-group-news-low-empty :inherit gnus-group-news-low :weight normal)
               (gnus-header-content :foreground ,hardhacker-purple)
               (gnus-header-from :foreground ,hardhacker-fg)
               (gnus-header-name :foreground ,hardhacker-green)
               (gnus-header-subject :foreground ,hardhacker-blue :weight bold)
               (gnus-summary-markup-face :foreground ,hardhacker-cyan)
               (gnus-summary-high-unread :foreground ,hardhacker-blue :weight bold)
               (gnus-summary-high-read :inherit gnus-summary-high-unread :weight normal)
               (gnus-summary-high-ancient :inherit gnus-summary-high-read)
               (gnus-summary-high-ticked :inherit gnus-summary-high-read :underline t)
               (gnus-summary-normal-unread :foreground ,hardhacker-blue :weight bold)
               (gnus-summary-normal-read :foreground ,hardhacker-comment :weight normal)
               (gnus-summary-normal-ancient :inherit gnus-summary-normal-read :weight light)
               (gnus-summary-normal-ticked :foreground ,hardhacker-blue :weight bold)
               (gnus-summary-low-unread :foreground ,hardhacker-comment :weight bold)
               (gnus-summary-low-read :inherit gnus-summary-low-unread :weight normal)
               (gnus-summary-low-ancient :inherit gnus-summary-low-read)
               (gnus-summary-low-ticked :inherit gnus-summary-low-read :underline t)
               (gnus-summary-selected :inverse-video t)
               ;; haskell-mode
               (haskell-operator-face :foreground ,hardhacker-blue)
               (haskell-constructor-face :foreground ,hardhacker-purple)
               ;; helm
               (helm-bookmark-w3m :foreground ,hardhacker-purple)
               (helm-buffer-not-saved :foreground ,hardhacker-purple :background ,hardhacker-bg)
               (helm-buffer-process :foreground ,hardhacker-yellow :background ,hardhacker-bg)
               (helm-buffer-saved-out :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (helm-buffer-size :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (helm-candidate-number :foreground ,hardhacker-bg :background ,hardhacker-fg)
               (helm-ff-directory :foreground ,hardhacker-green :background ,hardhacker-bg :weight bold)
               (helm-ff-dotted-directory :foreground ,hardhacker-green :background ,hardhacker-bg :weight normal)
               (helm-ff-executable :foreground ,hardhacker-blue :background ,hardhacker-bg :weight normal)
               (helm-ff-file :foreground ,hardhacker-fg :background ,hardhacker-bg :weight normal)
               (helm-ff-invalid-symlink :foreground ,hardhacker-blue :background ,hardhacker-bg :weight bold)
               (helm-ff-prefix :foreground ,hardhacker-bg :background ,hardhacker-blue :weight normal)
               (helm-ff-symlink :foreground ,hardhacker-blue :background ,hardhacker-bg :weight bold)
               (helm-grep-cmd-line :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (helm-grep-file :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (helm-grep-finish :foreground ,fg2 :background ,hardhacker-bg)
               (helm-grep-lineno :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (helm-grep-match :inherit match)
               (helm-grep-running :foreground ,hardhacker-green :background ,hardhacker-bg)
               (helm-header :foreground ,fg2 :background ,hardhacker-bg :underline nil :box nil)
               (helm-moccur-buffer :foreground ,hardhacker-green :background ,hardhacker-bg)
               (helm-selection :background ,bg2 :underline nil)
               (helm-selection-line :background ,bg2)
               (helm-separator :foreground ,hardhacker-purple :background ,hardhacker-bg)
               (helm-source-go-package-godoc-description :foreground ,hardhacker-yellow)
               (helm-source-header :foreground ,hardhacker-blue :background ,hardhacker-bg :underline nil :weight bold)
               (helm-time-zone-current :foreground ,hardhacker-yellow :background ,hardhacker-bg)
               (helm-time-zone-home :foreground ,hardhacker-purple :background ,hardhacker-bg)
               (helm-visible-mark :foreground ,hardhacker-bg :background ,hardhacker-selection)
               ;; highlight-indentation minor mode
               (highlight-indentation-face :background ,bg2)
               ;; icicle
               (icicle-whitespace-highlight :background ,hardhacker-fg)
               (icicle-special-candidate :foreground ,fg2)
               (icicle-extra-candidate :foreground ,fg2)
               (icicle-search-main-regexp-others :foreground ,hardhacker-fg)
               (icicle-search-current-input :foreground ,hardhacker-blue)
               (icicle-search-context-level-8 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-7 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-6 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-5 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-4 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-3 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-2 :foreground ,hardhacker-yellow)
               (icicle-search-context-level-1 :foreground ,hardhacker-yellow)
               (icicle-search-main-regexp-current :foreground ,hardhacker-fg)
               (icicle-saved-candidate :foreground ,hardhacker-fg)
               (icicle-proxy-candidate :foreground ,hardhacker-fg)
               (icicle-mustmatch-completion :foreground ,hardhacker-purple)
               (icicle-multi-command-completion :foreground ,fg2 :background ,bg2)
               (icicle-msg-emphasis :foreground ,hardhacker-green)
               (icicle-mode-line-help :foreground ,fg4)
               (icicle-match-highlight-minibuffer :foreground ,hardhacker-yellow)
               (icicle-match-highlight-Completions :foreground ,hardhacker-green)
               (icicle-key-complete-menu-local :foreground ,hardhacker-fg)
               (icicle-key-complete-menu :foreground ,hardhacker-fg)
               (icicle-input-completion-fail-lax :foreground ,hardhacker-blue)
               (icicle-input-completion-fail :foreground ,hardhacker-blue)
               (icicle-historical-candidate-other :foreground ,hardhacker-fg)
               (icicle-historical-candidate :foreground ,hardhacker-fg)
               (icicle-current-candidate-highlight :foreground ,hardhacker-yellow :background ,hardhacker-selection)
               (icicle-Completions-instruction-2 :foreground ,fg4)
               (icicle-Completions-instruction-1 :foreground ,fg4)
               (icicle-completion :foreground ,hardhacker-fg)
               (icicle-complete-input :foreground ,hardhacker-yellow)
               (icicle-common-match-highlight-Completions :foreground ,hardhacker-purple)
               (icicle-candidate-part :foreground ,hardhacker-fg)
               (icicle-annotation :foreground ,fg4)
               ;; icomplete
               (icompletep-determined :foreground ,hardhacker-yellow)
               ;; ido
               (ido-first-match
                ,@(if hardhacker-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :foreground hardhacker-green)
                    (list :weight 'bold :foreground hardhacker-blue)))
               (ido-only-match :foreground ,hardhacker-yellow)
               (ido-subdir :foreground ,hardhacker-yellow)
               (ido-virtual :foreground ,hardhacker-cyan)
               (ido-incomplete-regexp :inherit font-lock-warning-face)
               (ido-indicator :foreground ,hardhacker-fg :background ,hardhacker-blue)
               ;; ivy
               (ivy-current-match
                ,@(if hardhacker-alternate-mode-line-and-minibuffer
                      (list :weight 'normal :background hardhacker-selection :foreground hardhacker-green)
                    (list :weight 'bold :background hardhacker-selection :foreground hardhacker-blue)))
               ;; Highlights the background of the match.
               (ivy-minibuffer-match-face-1 :background ,hardhacker-selection)
               ;; Highlights the first matched group.
               (ivy-minibuffer-match-face-2 :background ,hardhacker-green
                                            :foreground ,hardhacker-bg)
               ;; Highlights the second matched group.
               (ivy-minibuffer-match-face-3 :background ,hardhacker-yellow
                                            :foreground ,hardhacker-bg)
               ;; Highlights the third matched group.
               (ivy-minibuffer-match-face-4 :background ,hardhacker-blue
                                            :foreground ,hardhacker-bg)
               (ivy-confirm-face :foreground ,hardhacker-yellow)
               (ivy-match-required-face :foreground ,hardhacker-red)
               (ivy-subdir :foreground ,hardhacker-yellow)
               (ivy-remote :foreground ,hardhacker-blue)
               (ivy-virtual :foreground ,hardhacker-cyan)
               ;; isearch
               (isearch :inherit match :weight bold)
               (isearch-fail :foreground ,hardhacker-bg :background ,hardhacker-yellow)
               ;; jde-java
               (jde-java-font-lock-constant-face :foreground ,hardhacker-cyan)
               (jde-java-font-lock-modifier-face :foreground ,hardhacker-blue)
               (jde-java-font-lock-number-face :foreground ,hardhacker-fg)
               (jde-java-font-lock-package-face :foreground ,hardhacker-fg)
               (jde-java-font-lock-private-face :foreground ,hardhacker-blue)
               (jde-java-font-lock-public-face :foreground ,hardhacker-blue)
               ;; js2-mode
               (js2-external-variable :foreground ,hardhacker-purple)
               (js2-function-param :foreground ,hardhacker-cyan)
               (js2-jsdoc-html-tag-delimiter :foreground ,hardhacker-yellow)
               (js2-jsdoc-html-tag-name :foreground ,hardhacker-blue)
               (js2-jsdoc-value :foreground ,hardhacker-yellow)
               (js2-private-function-call :foreground ,hardhacker-cyan)
               (js2-private-member :foreground ,fg3)
               ;; js3-mode
               (js3-error-face :underline ,hardhacker-yellow)
               (js3-external-variable-face :foreground ,hardhacker-fg)
               (js3-function-param-face :foreground ,hardhacker-blue)
               (js3-instance-member-face :foreground ,hardhacker-cyan)
               (js3-jsdoc-tag-face :foreground ,hardhacker-blue)
               (js3-warning-face :underline ,hardhacker-blue)
               ;; lsp
               (lsp-ui-peek-peek :background ,hardhacker-bg)
               (lsp-ui-peek-list :background ,bg2)
               (lsp-ui-peek-filename :foreground ,hardhacker-blue :weight bold)
               (lsp-ui-peek-line-number :foreground ,hardhacker-fg)
               (lsp-ui-peek-highlight :inherit highlight :distant-foreground ,hardhacker-bg)
               (lsp-ui-peek-header :background ,hardhacker-selection :foreground ,fg3, :weight bold)
               (lsp-ui-peek-footer :inherit lsp-ui-peek-header)
               (lsp-ui-peek-selection :inherit match)
               (lsp-ui-sideline-symbol :foreground ,fg4 :box (:line-width -1 :color ,fg4) :height 0.99)
               (lsp-ui-sideline-current-symbol :foreground ,hardhacker-fg :weight ultra-bold
                                               :box (:line-width -1 :color hardhacker-fg) :height 0.99)
               (lsp-ui-sideline-code-action :foreground ,hardhacker-yellow)
               (lsp-ui-sideline-symbol-info :slant italic :height 0.99)
               (lsp-ui-doc-background :background ,hardhacker-bg)
               (lsp-ui-doc-header :foreground ,hardhacker-bg :background ,hardhacker-cyan)
               ;; magit
               (magit-branch-local :foreground ,hardhacker-cyan)
               (magit-branch-remote :foreground ,hardhacker-green)
               (magit-refname :foreground ,hardhacker-blue)
               (magit-tag :foreground ,hardhacker-yellow)
               (magit-hash :foreground ,hardhacker-comment)
               (magit-dimmed :foreground ,hardhacker-comment)
               (magit-section-heading :foreground ,hardhacker-blue :weight bold)
               (magit-section-highlight :background ,hardhacker-selection :extend t)
               (magit-diff-context :foreground ,fg3 :extend t)
               (magit-diff-context-highlight :inherit magit-section-highlight
                                             :foreground ,hardhacker-fg)
               (magit-diff-revision-summary :foreground ,hardhacker-yellow
                                            :background ,hardhacker-bg
                                            :weight bold)
               (magit-diff-revision-summary-highlight :inherit magit-section-highlight
                                                      :foreground ,hardhacker-yellow
                                                      :weight bold)
               (magit-diff-added :background ,hardhacker-bg :foreground ,hardhacker-green)
               (magit-diff-added-highlight :background ,hardhacker-selection
                                           :foreground ,hardhacker-green)
               (magit-diff-removed :background ,hardhacker-bg :foreground ,hardhacker-red)
               (magit-diff-removed-highlight :background ,hardhacker-selection
                                             :foreground ,hardhacker-red)
               (magit-diff-file-heading :foreground ,hardhacker-fg)
               (magit-diff-file-heading-highlight :inherit magit-section-highlight
                                                  :weight bold)
               (magit-diff-file-heading-selection
                :inherit magit-diff-file-heading-highlight
                :foreground ,hardhacker-blue)
               (magit-diff-hunk-heading :inherit magit-diff-context
                                        :background ,bg3)
               (magit-diff-hunk-heading-highlight
                :inherit magit-diff-context-highlight
                :weight bold)
               (magit-diff-hunk-heading-selection
                :inherit magit-diff-hunk-heading-highlight
                :foreground ,hardhacker-blue)
               (magit-diff-lines-heading
                :inherit magit-diff-hunk-heading-highlight
                :foreground ,hardhacker-blue)
               (magit-diff-lines-boundary :background ,hardhacker-blue)
               (magit-diffstat-added :foreground ,hardhacker-green)
               (magit-diffstat-removed :foreground ,hardhacker-red)
               (magit-log-author :foreground ,hardhacker-comment)
               (magit-log-date :foreground ,hardhacker-comment)
               (magit-log-graph :foreground ,hardhacker-yellow)
               (magit-process-ng :foreground ,hardhacker-yellow :weight bold)
               (magit-process-ok :foreground ,hardhacker-green :weight bold)
               (magit-signature-good :foreground ,hardhacker-green)
               (magit-signature-bad :foreground ,hardhacker-red :weight bold)
               (magit-signature-untrusted :foreground ,hardhacker-cyan)
               (magit-signature-expired :foreground ,hardhacker-yellow)
               (magit-signature-revoked :foreground ,hardhacker-purple)
               (magit-signature-error :foreground ,hardhacker-cyan)
               (magit-cherry-unmatched :foreground ,hardhacker-cyan)
               (magit-cherry-equivalent :foreground ,hardhacker-purple)
               ;; markdown
               (markdown-blockquote-face :foreground ,hardhacker-yellow
                                         :slant italic)
               (markdown-code-face :foreground ,hardhacker-yellow)
               (markdown-footnote-face :foreground ,hardhacker-blue)
               (markdown-header-face :weight normal)
               (markdown-header-face-1
                :inherit bold :foreground ,hardhacker-blue
                ,@(when hardhacker-enlarge-headings
                    (list :height hardhacker-height-title-1)))
               (markdown-header-face-2
                :inherit bold :foreground ,hardhacker-purple
                ,@(when hardhacker-enlarge-headings
                    (list :height hardhacker-height-title-2)))
               (markdown-header-face-3
                :foreground ,hardhacker-green
                ,@(when hardhacker-enlarge-headings
                    (list :height hardhacker-height-title-3)))
               (markdown-header-face-4 :foreground ,hardhacker-yellow)
               (markdown-header-face-5 :foreground ,hardhacker-cyan)
               (markdown-header-face-6 :foreground ,hardhacker-yellow)
               (markdown-header-face-7 :foreground ,hardhacker-blue)
               (markdown-header-face-8 :foreground ,hardhacker-fg)
               (markdown-inline-code-face :foreground ,hardhacker-green)
               (markdown-plain-url-face :inherit link)
               (markdown-pre-face :foreground ,hardhacker-yellow)
               (markdown-table-face :foreground ,hardhacker-purple)
               (markdown-list-face :foreground ,hardhacker-cyan)
               (markdown-language-keyword-face :foreground ,hardhacker-comment)
               ;; message
               (message-header-to :foreground ,hardhacker-fg :weight bold)
               (message-header-cc :foreground ,hardhacker-fg :bold bold)
               (message-header-subject :foreground ,hardhacker-yellow)
               (message-header-newsgroups :foreground ,hardhacker-purple)
               (message-header-other :foreground ,hardhacker-purple)
               (message-header-name :foreground ,hardhacker-green)
               (message-header-xheader :foreground ,hardhacker-cyan)
               (message-separator :foreground ,hardhacker-cyan :slant italic)
               (message-cited-text :foreground ,hardhacker-purple)
               (message-cited-text-1 :foreground ,hardhacker-purple)
               (message-cited-text-2 :foreground ,hardhacker-yellow)
               (message-cited-text-3 :foreground ,hardhacker-comment)
               (message-cited-text-4 :foreground ,fg2)
               (message-mml :foreground ,hardhacker-green :weight normal)
               ;; mini-modeline
               (mini-modeline-mode-line :inherit mode-line :height 0.1 :box nil)
               ;; mu4e
               (mu4e-unread-face :foreground ,hardhacker-blue :weight normal)
               (mu4e-view-url-number-face :foreground ,hardhacker-purple)
               (mu4e-highlight-face :background ,hardhacker-bg
                                    :foreground ,hardhacker-yellow
                                    :extend t)
               (mu4e-header-highlight-face :background ,hardhacker-selection
                                           :foreground ,hardhacker-fg
                                           :underline nil :weight bold
                                           :extend t)
               (mu4e-header-key-face :inherit message-mml)
               (mu4e-header-marks-face :foreground ,hardhacker-purple)
               (mu4e-cited-1-face :foreground ,hardhacker-purple)
               (mu4e-cited-2-face :foreground ,hardhacker-yellow)
               (mu4e-cited-3-face :foreground ,hardhacker-comment)
               (mu4e-cited-4-face :foreground ,fg2)
               (mu4e-cited-5-face :foreground ,fg3)
               ;; neotree
               (neo-banner-face :foreground ,hardhacker-yellow :weight bold)
               ;;(neo-button-face :underline nil)
               (neo-dir-link-face :foreground ,hardhacker-purple)
               (neo-expand-btn-face :foreground ,hardhacker-fg)
               (neo-file-link-face :foreground ,hardhacker-cyan)
               (neo-header-face :background ,hardhacker-bg
                                :foreground ,hardhacker-fg
                                :weight bold)
               (neo-root-dir-face :foreground ,hardhacker-purple :weight bold)
               (neo-vc-added-face :foreground ,hardhacker-yellow)
               (neo-vc-conflict-face :foreground ,hardhacker-red)
               (neo-vc-default-face :inherit neo-file-link-face)
               (neo-vc-edited-face :foreground ,hardhacker-yellow)
               (neo-vc-ignored-face :foreground ,hardhacker-comment)
               (neo-vc-missing-face :foreground ,hardhacker-red)
               (neo-vc-needs-merge-face :foreground ,hardhacker-red
                                        :weight bold)
               ;;(neo-vc-needs-update-face :underline t)
               ;;(neo-vc-removed-face :strike-through t)
               (neo-vc-unlocked-changes-face :foreground ,hardhacker-red)
               ;;(neo-vc-unregistered-face nil)
               (neo-vc-up-to-date-face :foreground ,hardhacker-green)
               (neo-vc-user-face :foreground ,hardhacker-purple)
               ;; org
               (org-agenda-date :foreground ,hardhacker-cyan :underline nil)
               (org-agenda-dimmed-todo-face :foreground ,hardhacker-comment)
               (org-agenda-done :foreground ,hardhacker-green)
               (org-agenda-structure :foreground ,hardhacker-purple)
               (org-block :foreground ,hardhacker-yellow)
               (org-code :foreground ,hardhacker-green)
               (org-column :background ,bg3)
               (org-column-title :inherit org-column :weight bold :underline t)
               (org-date :foreground ,hardhacker-cyan :underline t)
               (org-document-info :foreground ,hardhacker-blue)
               (org-document-info-keyword :foreground ,hardhacker-comment)
               (org-document-title :weight bold :foreground ,hardhacker-yellow
                                   ,@(when hardhacker-enlarge-headings
                                       (list :height hardhacker-height-doc-title)))
               (org-done :foreground ,hardhacker-green)
               (org-ellipsis :foreground ,hardhacker-comment)
               (org-footnote :foreground ,hardhacker-blue)
               (org-formula :foreground ,hardhacker-blue)
               (org-headline-done :foreground ,hardhacker-comment
                                  :weight normal :strike-through t)
               (org-hide :foreground ,hardhacker-bg :background ,hardhacker-bg)
               (org-level-1 :inherit bold :foreground ,hardhacker-blue
                            ,@(when hardhacker-enlarge-headings
                                (list :height hardhacker-height-title-1)))
               (org-level-2 :inherit bold :foreground ,hardhacker-purple
                            ,@(when hardhacker-enlarge-headings
                                (list :height hardhacker-height-title-2)))
               (org-level-3 :weight normal :foreground ,hardhacker-green
                            ,@(when hardhacker-enlarge-headings
                                (list :height hardhacker-height-title-3)))
               (org-level-4 :weight normal :foreground ,hardhacker-yellow)
               (org-level-5 :weight normal :foreground ,hardhacker-cyan)
               (org-level-6 :weight normal :foreground ,hardhacker-yellow)
               (org-level-7 :weight normal :foreground ,hardhacker-blue)
               (org-level-8 :weight normal :foreground ,hardhacker-fg)
               (org-link :foreground ,hardhacker-cyan :underline t)
               (org-priority :foreground ,hardhacker-cyan)
               (org-quote :foreground ,hardhacker-yellow :slant italic)
               (org-scheduled :foreground ,hardhacker-green)
               (org-scheduled-previously :foreground ,hardhacker-yellow)
               (org-scheduled-today :foreground ,hardhacker-green)
               (org-sexp-date :foreground ,fg4)
               (org-special-keyword :foreground ,hardhacker-yellow)
               (org-table :foreground ,hardhacker-purple)
               (org-tag :foreground ,hardhacker-blue :weight bold :background ,bg2)
               (org-todo :foreground ,hardhacker-yellow :weight bold :background ,bg2)
               (org-upcoming-deadline :foreground ,hardhacker-yellow)
               (org-verbatim :inherit org-quote)
               (org-warning :weight bold :foreground ,hardhacker-blue)
               ;; outline
               (outline-1 :foreground ,hardhacker-blue)
               (outline-2 :foreground ,hardhacker-purple)
               (outline-3 :foreground ,hardhacker-green)
               (outline-4 :foreground ,hardhacker-yellow)
               (outline-5 :foreground ,hardhacker-cyan)
               (outline-6 :foreground ,hardhacker-yellow)
               ;; perspective
               (persp-selected-face :weight bold :foreground ,hardhacker-blue)
               ;; powerline
               (powerline-active1 :background ,hardhacker-bg :foreground ,hardhacker-blue)
               (powerline-active2 :background ,hardhacker-bg :foreground ,hardhacker-blue)
               (powerline-inactive1 :background ,bg2 :foreground ,hardhacker-purple)
               (powerline-inactive2 :background ,bg2 :foreground ,hardhacker-purple)
               (powerline-evil-base-face :foreground ,bg2)
               (powerline-evil-emacs-face :inherit powerline-evil-base-face :background ,hardhacker-yellow)
               (powerline-evil-insert-face :inherit powerline-evil-base-face :background ,hardhacker-cyan)
               (powerline-evil-motion-face :inherit powerline-evil-base-face :background ,hardhacker-purple)
               (powerline-evil-normal-face :inherit powerline-evil-base-face :background ,hardhacker-green)
               (powerline-evil-operator-face :inherit powerline-evil-base-face :background ,hardhacker-blue)
               (powerline-evil-replace-face :inherit powerline-evil-base-face :background ,hardhacker-red)
               (powerline-evil-visual-face :inherit powerline-evil-base-face :background ,hardhacker-yellow)
               ;; rainbow-delimiters
               (rainbow-delimiters-depth-1-face :foreground ,hardhacker-fg)
               (rainbow-delimiters-depth-2-face :foreground ,hardhacker-cyan)
               (rainbow-delimiters-depth-3-face :foreground ,hardhacker-purple)
               (rainbow-delimiters-depth-4-face :foreground ,hardhacker-blue)
               (rainbow-delimiters-depth-5-face :foreground ,hardhacker-yellow)
               (rainbow-delimiters-depth-6-face :foreground ,hardhacker-green)
               (rainbow-delimiters-depth-7-face :foreground ,hardhacker-yellow)
               (rainbow-delimiters-depth-8-face :foreground ,hardhacker-blue)
               (rainbow-delimiters-unmatched-face :foreground ,hardhacker-yellow)
               ;; rpm-spec
               (rpm-spec-dir-face :foreground ,hardhacker-green)
               (rpm-spec-doc-face :foreground ,hardhacker-blue)
               (rpm-spec-ghost-face :foreground ,hardhacker-purple)
               (rpm-spec-macro-face :foreground ,hardhacker-yellow)
               (rpm-spec-obsolete-tag-face :inherit font-lock-warning-face)
               (rpm-spec-package-face :foreground ,hardhacker-purple)
               (rpm-spec-section-face :foreground ,hardhacker-yellow)
               (rpm-spec-tag-face :foreground ,hardhacker-cyan)
               (rpm-spec-var-face :foreground ,hardhacker-yellow)
               ;; rst (reStructuredText)
               (rst-level-1 :foreground ,hardhacker-blue :weight bold)
               (rst-level-2 :foreground ,hardhacker-purple :weight bold)
               (rst-level-3 :foreground ,hardhacker-green)
               (rst-level-4 :foreground ,hardhacker-yellow)
               (rst-level-5 :foreground ,hardhacker-cyan)
               (rst-level-6 :foreground ,hardhacker-yellow)
               (rst-level-7 :foreground ,hardhacker-blue)
               (rst-level-8 :foreground ,hardhacker-fg)
               ;; selectrum-mode
               (selectrum-current-candidate :weight bold)
               (selectrum-primary-highlight :foreground ,hardhacker-blue)
               (selectrum-secondary-highlight :foreground ,hardhacker-green)
               ;; show-paren
               (show-paren-match-face :background unspecified
                                      :foreground ,hardhacker-cyan
                                      :weight bold)
               (show-paren-match :background unspecified
                                 :foreground ,hardhacker-cyan
                                 :weight bold)
               (show-paren-match-expression :inherit match)
               (show-paren-mismatch :inherit font-lock-warning-face)
               ;; shr
               (shr-h1 :foreground ,hardhacker-blue :weight bold :height 1.3)
               (shr-h2 :foreground ,hardhacker-purple :weight bold)
               (shr-h3 :foreground ,hardhacker-green :slant italic)
               (shr-h4 :foreground ,hardhacker-yellow)
               (shr-h5 :foreground ,hardhacker-cyan)
               (shr-h6 :foreground ,hardhacker-yellow)
               ;; slime
               (slime-repl-inputed-output-face :foreground ,hardhacker-purple)
               ;; spam
               (spam :inherit gnus-summary-normal-read :foreground ,hardhacker-yellow
                     :strike-through t :slant oblique)
               ;; speedbar (and sr-speedbar)
               (speedbar-button-face :foreground ,hardhacker-green)
               (speedbar-file-face :foreground ,hardhacker-cyan)
               (speedbar-directory-face :foreground ,hardhacker-purple)
               (speedbar-tag-face :foreground ,hardhacker-yellow)
               (speedbar-selected-face :foreground ,hardhacker-blue)
               (speedbar-highlight-face :inherit match)
               (speedbar-separator-face :background ,hardhacker-bg
                                        :foreground ,hardhacker-fg
                                        :weight bold)
               ;; tab-bar & tab-line (since Emacs 27.1)
               (tab-bar :foreground ,hardhacker-purple :background ,hardhacker-selection
                        :inherit variable-pitch)
               (tab-bar-tab :foreground ,hardhacker-blue :background ,hardhacker-bg
                            :box (:line-width 2 :color ,hardhacker-bg :style nil))
               (tab-bar-tab-inactive :foreground ,hardhacker-purple :background ,bg2
                                     :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line :foreground ,hardhacker-purple :background ,hardhacker-selection
                         :height 0.9 :inherit variable-pitch)
               (tab-line-tab :foreground ,hardhacker-blue :background ,hardhacker-bg
                             :box (:line-width 2 :color ,hardhacker-bg :style nil))
               (tab-line-tab-inactive :foreground ,hardhacker-purple :background ,bg2
                                      :box (:line-width 2 :color ,bg2 :style nil))
               (tab-line-tab-current :inherit tab-line-tab)
               (tab-line-close-highlight :foreground ,hardhacker-red)
               ;; telephone-line
               (telephone-line-accent-active :background ,hardhacker-bg :foreground ,hardhacker-blue)
               (telephone-line-accent-inactive :background ,bg2 :foreground ,hardhacker-purple)
               (telephone-line-unimportant :background ,hardhacker-bg :foreground ,hardhacker-comment)
               ;; term
               (term :foreground ,hardhacker-fg :background ,hardhacker-bg)
               (term-color-black :foreground ,hardhacker-bg :background ,hardhacker-comment)
               (term-color-blue :foreground ,hardhacker-purple :background ,hardhacker-purple)
               (term-color-cyan :foreground ,hardhacker-cyan :background ,hardhacker-cyan)
               (term-color-green :foreground ,hardhacker-green :background ,hardhacker-green)
               (term-color-magenta :foreground ,hardhacker-blue :background ,hardhacker-blue)
               (term-color-red :foreground ,hardhacker-red :background ,hardhacker-red)
               (term-color-white :foreground ,hardhacker-fg :background ,hardhacker-fg)
               (term-color-yellow :foreground ,hardhacker-yellow :background ,hardhacker-yellow)
               ;; tree-sitter
               (tree-sitter-hl-face:attribute :inherit font-lock-constant-face)
               (tree-sitter-hl-face:comment :inherit font-lock-comment-face)
               (tree-sitter-hl-face:constant :inherit font-lock-constant-face)
               (tree-sitter-hl-face:constant.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:constructor :inherit font-lock-constant-face)
               (tree-sitter-hl-face:escape :foreground ,hardhacker-blue)
               (tree-sitter-hl-face:function :inherit font-lock-function-name-face)
               (tree-sitter-hl-face:function.builtin :inherit font-lock-builtin-face)
               (tree-sitter-hl-face:function.call :inherit font-lock-function-name-face
                                                  :weight normal)
               (tree-sitter-hl-face:function.macro :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:function.special :inherit font-lock-preprocessor-face)
               (tree-sitter-hl-face:keyword :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:punctuation :foreground ,hardhacker-blue)
               (tree-sitter-hl-face:punctuation.bracket :foreground ,hardhacker-fg)
               (tree-sitter-hl-face:punctuation.delimiter :foreground ,hardhacker-fg)
               (tree-sitter-hl-face:punctuation.special :foreground ,hardhacker-blue)
               (tree-sitter-hl-face:string :inherit font-lock-string-face)
               (tree-sitter-hl-face:string.special :foreground ,hardhacker-red)
               (tree-sitter-hl-face:tag :inherit font-lock-keyword-face)
               (tree-sitter-hl-face:type :inherit font-lock-type-face)
               (tree-sitter-hl-face:type.parameter :foreground ,hardhacker-blue)
               (tree-sitter-hl-face:variable :inherit font-lock-variable-name-face)
               (tree-sitter-hl-face:variable.parameter :inherit tree-sitter-hl-face:variable
                                                       :weight normal)
               ;; undo-tree
               (undo-tree-visualizer-current-face :foreground ,hardhacker-yellow)
               (undo-tree-visualizer-default-face :foreground ,fg2)
               (undo-tree-visualizer-register-face :foreground ,hardhacker-purple)
               (undo-tree-visualizer-unmodified-face :foreground ,hardhacker-fg)
               ;; web-mode
               (web-mode-builtin-face :inherit font-lock-builtin-face)
               (web-mode-comment-face :inherit font-lock-comment-face)
               (web-mode-constant-face :inherit font-lock-constant-face)
               (web-mode-css-property-name-face :inherit font-lock-constant-face)
               (web-mode-doctype-face :inherit font-lock-comment-face)
               (web-mode-function-name-face :inherit font-lock-function-name-face)
               (web-mode-html-attr-name-face :foreground ,hardhacker-purple)
               (web-mode-html-attr-value-face :foreground ,hardhacker-green)
               (web-mode-html-tag-face :foreground ,hardhacker-blue :weight bold)
               (web-mode-keyword-face :foreground ,hardhacker-blue)
               (web-mode-string-face :foreground ,hardhacker-yellow)
               (web-mode-type-face :inherit font-lock-type-face)
               (web-mode-warning-face :inherit font-lock-warning-face)
               ;; which-func
               (which-func :inherit font-lock-function-name-face)
               ;; which-key
               (which-key-key-face :inherit font-lock-builtin-face)
               (which-key-command-description-face :inherit default)
               (which-key-separator-face :inherit font-lock-comment-delimiter-face)
               (which-key-local-map-description-face :foreground ,hardhacker-green)
               ;; whitespace
               (whitespace-big-indent :background ,hardhacker-red :foreground ,hardhacker-red)
               (whitespace-empty :background ,hardhacker-yellow :foreground ,hardhacker-red)
               (whitespace-hspace :background ,hardhacker-selection :foreground ,hardhacker-comment)
               (whitespace-indentation :background ,hardhacker-yellow :foreground ,hardhacker-red)
               (whitespace-line :background ,hardhacker-bg :foreground ,hardhacker-blue)
               (whitespace-newline :foreground ,hardhacker-comment)
               (whitespace-space :background ,hardhacker-bg :foreground ,hardhacker-comment)
               (whitespace-space-after-tab :background ,hardhacker-yellow :foreground ,hardhacker-red)
               (whitespace-space-before-tab :background ,hardhacker-yellow :foreground ,hardhacker-red)
               (whitespace-tab :background ,bg2 :foreground ,hardhacker-comment)
               (whitespace-trailing :inherit trailing-whitespace)
               ;; yard-mode
               (yard-tag-face :inherit font-lock-builtin-face)
               (yard-directive-face :inherit font-lock-builtin-face))))

  (apply #'custom-theme-set-faces
         'hardhacker
         (let ((expand-with-func
                (lambda (func spec)
                  (let (reduced-color-list)
                    (dolist (col colors reduced-color-list)
                      (push (list (car col) (funcall func col))
                            reduced-color-list))
                    (eval `(let ,reduced-color-list
                             (backquote ,spec))))))
               whole-theme)
           (pcase-dolist (`(,face . ,spec) faces)
             (push `(,face
                     ((((min-colors 16777216)) ; fully graphical envs
                       ,(funcall expand-with-func 'cadr spec))
                      (((min-colors 256))      ; terminal withs 256 colors
                       ,(if hardhacker-use-24-bit-colors-on-256-colors-terms
                            (funcall expand-with-func 'cadr spec)
                          (funcall expand-with-func 'caddr spec)))
                      (t                       ; should be only tty-like envs
                       ,(funcall expand-with-func 'cadddr spec))))
                   whole-theme))
           whole-theme))

  (apply #'custom-theme-set-variables
         'hardhacker
         (let ((get-func
                (pcase (display-color-cells)
                  ((pred (<= 16777216)) 'car) ; fully graphical envs
                  ((pred (<= 256)) 'cadr)     ; terminal withs 256 colors
                  (_ 'caddr))))               ; should be only tty-like envs
           `((ansi-color-names-vector
              [,(funcall get-func (alist-get 'hardhacker-bg colors))
               ,(funcall get-func (alist-get 'hardhacker-red colors))
               ,(funcall get-func (alist-get 'hardhacker-green colors))
               ,(funcall get-func (alist-get 'hardhacker-yellow colors))
               ,(funcall get-func (alist-get 'hardhacker-comment colors))
               ,(funcall get-func (alist-get 'hardhacker-purple colors))
               ,(funcall get-func (alist-get 'hardhacker-cyan colors))
               ,(funcall get-func (alist-get 'hardhacker-fg colors))])))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'hardhacker)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; hardhacker-theme.el ends here
