;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     auto-completion
     aggressive-indent
     emacs-lisp
     python
     html
     git
     gnus
     ;; markdown
     org
     syntax-checking
     shell
     themes-megapack
     perspectives)
   dotspacemacs-additional-packages
   '(
     rainbow-mode
     zeal-at-point
     mu4e-maildirs-extension
     elfeed
     minimap
     ocodo-svg-modelines
     pdf-tools
     ztree
     centered-window-mode)
   ;; A list of packages and/or extensions that will not be install and loaded.
dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
;;  (setq use-package-verbose t)
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(hc-zenburn
                         solarized-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ubuntu Mono"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  (setq magit-repo-dirs '("~/repos/"))

  ;; (require 'git-gutter-fringe)
  ;; (setq git-gutter-fr:side 'right-fringe)
  ;; (setq git-magit-status-fullscreen t)
  ;; (setq git-enable-github-support t)
  ;; (setq git-gutter-use-fringe t)
  ;; (set-face-foreground 'git-gutter-fr:modified "blue")
  ;; (set-face-foreground 'git-gutter-fr:added    "green")
  ;; (set-face-foreground 'git-gutter-fr:deleted  "red")
  ;; (global-git-gutter-mode t)
  ;; (add-to-list 'git-gutter:update-hooks 'focus-in-hook)

  (setq global-hl-line-mode -1)

  ;; (custom-persp "cms30"
  ;;  (progn
  ;;   (find-file "~/repos/sites/cms30/project/templates/base.html")
  ;;   (split-window-right)
  ;;   (find-file "~/repos/sites/cms30/requirements.txt")
  ;;  ))

  (evil-leader/set-key-for-mode 'python-mode "mhz" 'zeal-at-point)
  ;; (setq zeal-at-point-mode-alist (remove '(python-mode . "python3") zeal-at-point-mode-alist))

  ;; (global-set-key (kbd "<mouse-2>") 'x-primary-yank)
  (setq x-select-enable-primary t)
  (setq mouse-drag-copy-region t)

  ;; Get email, and store in nnml
  (setq gnus-secondary-select-methods
        '(
          (nnimap "auf"
                  (nnimap-address
                   "imap.ca.auf.org")
                  (nnimap-server-port 993)
                  (nnimap-stream ssl))
          ))

  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp-sortant.ca.auf.org")

  ;; Archive outgoing email in Sent folder on imap.gmail.com:
  (setq gnus-message-archive-method '(nnimap "imap.ca.auf.org")
        gnus-message-archive-group "Sent")

  ;; store email in ~/gmail directory
  (setq nnml-directory "/home/patrick/.auf")
  (setq message-directory "/home/patrick/.auf")

  (defun term-send-r () (interactive) (term-send-raw-string "\C-r"))
  (defun term-send-c () (interactive) (term-send-raw-string "\C-c"))
  (defun term-send-d () (interactive) (term-send-raw-string "\C-d"))
  (defun term-send-D () (interactive) (term-send-raw-string "\C-D"))
  (defun term-send-z () (interactive) (term-send-raw-string "\C-z"))
  (evil-define-key 'insert term-raw-map (kbd "C-r") 'term-send-r)
  (evil-define-key 'insert term-raw-map (kbd "C-c") 'term-send-c)
  (evil-define-key 'insert term-raw-map (kbd "C-d") 'term-send-d)
  (evil-define-key 'insert term-raw-map (kbd "C-D") 'term-send-D)
  (evil-define-key 'insert term-raw-map (kbd "C-z") 'term-send-z)

  (require 'mu4e)

  ;; Only needed if your maildir is _not_ ~/Maildir
  ;; Must be a real dir, not a symlink
  (setq mu4e-maildir "/home/patrick/AUF")

  ;; these must start with a "/", and must exist
  ;; (i.e.. /home/user/Maildir/sent must exist)
  ;; you use e.g. 'mu mkdir' to make the Maildirs if they don't
  ;; already exist

  ;; below are the defaults; if they do not exist yet, mu4e offers to
  ;; create them. they can also functions; see their docstrings.
  ;; (setq mu4e-sent-folder   "/sent")
  ;; (setq mu4e-drafts-folder "/drafts")
  ;; (setq mu4e-trash-folder  "/trash")

  ;; smtp mail setting; these are the same that `gnus' uses.
  (setq
  message-send-mail-function   'smtpmail-send-it
  smtpmail-default-smtp-server "smtp-sortant.ca.auf.org"
  smtpmail-smtp-server         "smtp-sortant.ca.auf.org"
  smtpmail-local-domain        "auf.org")
  (setq
      mu4e-get-mail-command "offlineimap"   ;; or fetchmail, or ...
      mu4e-update-interval 60)

  (mu4e-maildirs-extension)

  (setq elfeed-feeds
      '("https://news.ycombinator.com/rss"))

  (modify-syntax-entry ?- "w")
  (modify-syntax-entry ?~ "w")
  (modify-syntax-entry ?/ "w")
  (modify-syntax-entry ?_ "w")

;;  (pdf-tools-install)
  (setq global-auto-revert-mode t)

  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'ztree-mode)

  (setq helm-split-window-default-side 'left)
  (setq helm-split-window-in-side-p t)
  (setq git-use-magit-next t)
  (setq web-mode-engines-alist
      '(("django" . "\\.html\\'"))
  )
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq minimap-update-delay 0)
  (setq minimap-window-location 'right)
  )




;; See http://bzg.fr/emacs-hide-mode-line.html
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
;; (hidden-mode-line-mode 1)

;; If you want to hide the mode-line in all new buffers
;; (add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

;; Alternatively, you can paint your mode-line in White but then
;; you'll have to manually paint it in black again
;; (custom-set-faces
;;  '(mode-line-highlight ((t nil)))
;;  '(mode-line ((t (:foreground "white" :background "white"))))
;;  '(mode-line-inactive ((t (:background "white" :foreground "white")))))



;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))

;; Now activate this global minor mode
;; (bzg-big-fringe-mode 1)

;; To activate the fringe by default and deactivate it when windows
;; are split vertically, uncomment this:
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (if (delq nil
;;                       (let ((fw (frame-width)))
;;                         (mapcar (lambda(w) (< (window-width w) fw))
;;                                 (window-list))))
;;                 (bzg-big-fringe-mode 0)
;;               (bzg-big-fringe-mode 1))))

;; Use a minimal cursor
;; (setq default-cursor-type 'hbar)


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
