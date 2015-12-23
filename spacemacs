;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/repos/spacemacs/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     avoine
     auto-completion
     emacs-lisp
     racket
     scheme
     python
     django
     latex
;     ess
     html
     git
     version-control
     gnus
     mu4e
     org
     syntax-checking
     spell-checking
     shell
     rcirc
     jabber
     dash
     geolocation
     spacemacs-layouts)
   dotspacemacs-additional-packages
   '(
     firefox-controller
     exwm
     keyfreq
     tabbar
;     evil-tabs
;     ox-pandoc
     ox-rst
;     org-ehtml
     ox-twbs
     org-redmine
     rainbow-mode
     mu4e-maildirs-extension
     evil-paredit
     minimap
     ocodo-svg-modelines
     pdf-tools
     ztree
     ample-theme
;     sublimity
     eval-in-repl
     ssh
     ob-http
     mu4e-alert
     centered-window-mode)
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-themes '(ample
                         hc-zenburn
                         solarized-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1)
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

;;  (require 'org)
;;  (defun test-after-change (begin end length)
;;    (org-update-all-dblocks))
;;  (add-hook 'org-mode-hook
;;            (lambda ()
;;              (add-hook 'after-change-functions 'test-after-change t nil)))

  (setq org-confirm-babel-evaluate nil)

  (setq org-ehtml-docroot "/home/patrick/public_org/")
  (setq org-ehtml-everything-editable t)

)

(defun dotspacemacs/user-config ()
  (setq magit-repo-dirs '("~/repos/"))

  (setq global-hl-line-mode -1)
  (setq echo-keystrokes 0.5)
  (setq mouse-yank-at-point t)

  ;; (custom-persp "cms30"
  ;;  (progn
  ;;   (find-file "~/repos/sites/cms30/project/templates/base.html")
  ;;   (split-window-right)
  ;;   (find-file "~/repos/sites/cms30/requirements.txt")
  ;;  ))

  ;;(evil-leader/set-key-for-mode 'python-mode "mhz" 'zeal-at-point)
  ;; (setq zeal-at-point-mode-alist (remove '(python-mode . "python3") zeal-at-point-mode-alist))

  ;; (global-set-key (kbd "<mouse-2>") 'x-primary-yank)
  (setq x-select-enable-primary t)
  (setq mouse-drag-copy-region t)

  (require 'tabbar)
  (tabbar-mode t)
  (setq tabbar-use-images nil)
  (setq tabbar-buffer-groups-function nil)
  (global-set-key (kbd "M-]") 'tabbar-forward)
  (global-set-key (kbd "M-[") 'tabbar-backward)

  ; eshell

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

  (setq read-file-name-completion-ignore-case t)
  (setq read-buffer-completion-ignore-case t)
  (mapc (lambda (x)
        (add-to-list 'completion-ignored-extensions x))
      '(".aux" ".bbl" ".go" ".exe" ".pyc"))

  ; mu4e
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
   mu4e-update-interval nil)

  (mu4e-maildirs-extension)

  (modify-syntax-entry ?- "w")
  (modify-syntax-entry ?~ "w")
  (modify-syntax-entry ?/ "w")
  (modify-syntax-entry ?_ "w")

  ;;  (pdf-tools-install)
  (setq global-auto-revert-mode t)

  (add-to-list 'evil-emacs-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-emacs-state-modes 'ztree-mode)
  (add-to-list 'evil-emacs-state-modes 'eww-mode)
  (add-to-list 'evil-emacs-state-modes 'wl-folder-mode)
  (add-to-list 'evil-emacs-state-modes 'wl-summary-mode)
  (add-to-list 'evil-emacs-state-modes 'wl-plugged-mode)
  (add-to-list 'evil-emacs-state-modes 'wl-news-mode)

  (setq helm-split-window-default-side 'left)
  (setq helm-split-window-in-side-p t)
  (setq web-mode-engines-alist
        '(("django" . "\\.html\\'")))
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq minimap-update-delay 0)
  (setq minimap-window-location 'right)

  (setq rcirc-enable-authinfo-support t)
  (setq rcirc-server-alist
        '(("localhost"
           :nick "avoine"
           :user "avoine"
           :port "6667"
           )))

  (setq geiser-default-implementation 'guile)
  (setq geiser-repl-use-other-window nil)
  (setq geiser-guile-binary "/usr/bin/guile")
  (setq geiser-guile-load-path (list "/usr/share/geiser/guile"
                                     "/usr/share/guile/2.0/srfi"))
  (setq geiser-active-implementations '(guile racket)
        geiser-mode-smart-tab-p t
        geiser-repl-autodoc-p t
        geiser-repl-history-filename "~/.emacs.d/geiser-history"
        geiser-repl-query-on-kill-p nil
        geiser-implementations-alist
        '(((regexp "\\.scm$") guile)
          ((regexp "\\.ss$") guile)
          ((regexp "\\.rkt$") racket)))

  ;; set maximum indentation for description lists
  (setq org-list-description-max-indent 5)

  ;; prevent demoting heading also shifting text inside sections
  (setq org-adapt-indentation nil)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (sql . t)
     (dot . t)
     (scheme . t)
;     (R . t)
     (org . t)
     (http . t)
     (shell . t )))
  (setq org-babel-shell-names 'bash)
  (setq scroll-preserve-screen-position 'always)

  (setq jabber-username "patrick.hetu")
  (setq jabber-server "auf.org")

  (setq jabber-history-enabled t)

  (add-hook 'jabber-alert-message-hooks 'jabber-message-libnotify)

  (setq shell-default-shell 'eshell)
  (setq eshell-prefer-lisp-functions t)
  (setq eshell-prefer-lisp-variables t)
  (setq password-cache t) ; enable password caching
  (setq password-cache-expiry 3600) ; for one hour (time in secs)

  (display-time-mode 1)

  (setq sunshine-location "Montreal, Canada")
  (setq sunshine-appid "6b9778c84185d07c9040f691631b8587")
  (setq sunshine-units 'metric)

  (setq org-redmine-uri "https://redmine.auf.org")
  (setq org-redmine-auth-api-key "e3127a14dd7155e3fb14849f08607e0ef51bb5a6")

  (setq org-table-convert-region-max-lines 9999)
  (setq org-export-with-sub-superscripts nil)
  (require 'org)
  (setq org-publish-project-alist
  '(("html"
     :base-directory "~/org/auf/owncloud/"
     :base-extension "org"
     :recursive t
     :publishing-directory "~/public_html"
     :publishing-function org-html-publish-to-html)))
  )



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
 '(org-crypt-disable-auto-save (quote encypt))
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t)
 '(safe-local-variable-values
   (quote
    ((eval modify-syntax-entry 43 "'")
     (eval modify-syntax-entry 36 "'")
     (eval modify-syntax-entry 126 "'")
     (encoding . utf-8)))))

(defun cb-org:looking-at-pgp-section? ()
  (unless (org-before-first-heading-p)
    (save-excursion
      (org-back-to-heading t)
      (let ((heading-point (point))
            (heading-was-invisible-p
             (save-excursion
               (outline-end-of-heading)
               (outline-invisible-p))))
        (forward-line)
        (looking-at "-----BEGIN PGP MESSAGE-----")))))

(defun cb-org:decrypt-entry ()
  (when (cb-org:looking-at-pgp-section?)
    (org-decrypt-entry)
    t))

(add-hook 'org-ctrl-c-ctrl-c-hook 'cb-org:decrypt-entry)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#bdbdb3" :background "gray13"))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
