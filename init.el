;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(graphviz
     php
     python
     csv
     yaml
     ruby
     javascript
     html
     django
     themes-megapack
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complet
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-minimum-prefix-length 2
                      auto-completion-idle-delay 0.2
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup nil
                      auto-completion-enable-help-tooltip nil
                      auto-completion-use-company-box nil
                      auto-completion-enable-sort-by-usage nil)
     ;; better-defaults
     emacs-lisp
     ;; mu4e
     ;; (mu4e :variables
     ;;       mu4e-installation-path "/opt/homebrew/Cellar/mu/1.12.1/share/emacs/site-lisp/mu/mu4e/"
     ;;       mu4e-maildir "~/.maildir"
     ;;       mu4e-trash-folder "/Trash"
     ;;       mu4e-refile-folder "/Archive"
     ;;       mu4e-get-mail-command "mbsync -a"
     ;;       mu4e-update-interval nil
     ;;       mu4e-compose-signature-auto-include nil
     ;;       mu4e-view-show-images t
     ;;       mu4e-view-show-addresses t)
     git
     helm
     bibtex
     deft
     sql
     ;; tabs
     ;; lsp
     ;; markdown
     multiple-cursors
     org
     (org :variables
          org-enable-roam-support t
          org-enable-roam-ui t
          org-roam-ui-mode t
          org-enable-roam-protocol t
          ;; org-enable-org-contacts-support t
          org-enable-bootstrap-support t
          ;; org-contacts-files '("~/Dropbox/org/contacts.org")

          )
     org-roam-bibtex
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     tern
     (tern :variables tern-command '("node" "/opt/homebrew/bin/tern"))
     treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      sqlite3
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-superstar)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need to
   ;; compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;;
   ;; WARNING: pdumper does not work with Native Compilation, so it's disabled
   ;; regardless of the following setting when native compilation is in effect.
   ;;
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((bookmarks . 7)
                                (recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or poioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("IBM Plex Mono"
                               :size 13.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
     :visual nil
     :disabled-for-modes dired-mode
                         doc-view-mode
                         markdown-mode
                         org-mode
                         pdf-view-mode
                         text-mode
    :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; https://emacs.stackexchange.com/questions/35117/how-to-set-the-keybinding-for-addind-the-hash-symbol-in-spacemacs-with-macos
  (setq-default mac-right-option-modifier nil)

  (setq mac-option-modifier nil
        mac-command-modifier 'meta
        x-select-enable-clipboard t)

  (add-to-list 'image-types 'svg) ;; solve a problem raised by launching dired - svg reading in Mac OS Ventura - https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg

  (setq org-roam-directory "~/Dropbox/org-roam/")
  (setq org-roam-capture-templates
        '(("c" "concept" plain "%?"
           :if-new
           (file+head "~/Dropbox/org-roam/concept/%<%Y%m%d%H%M%S>-${title}.org" "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("r" "reference" plain "%?"
           :if-new
           (file+head "~/Dropbox/org-roam/reference/%<%Y%m%d%H%M%S>-${title}.org" "#+title: ${title}\n#+filetags: :reference:\n")
           :immediate-finish t
           :unnarrowed t)))

  (setq deft-directory org-roam-directory)
  (setq deft-extensions '("org" "md" "txt"))
  (setq deft-recursive t)

  (setq bibtex-dialect 'biblatex)
)


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
 ;; (when (string= system-type "darwin")
 ;;   (setq dired-use-ls-dired nil))
 ;; (cond ((eq system-type 'berkeley-unix)
 ;;        (setq insert-directory-program "/opt/homebrew/bin/gls")))
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired t
          insert-directory-program "/opt/homebrew/bin/gls"
          dired-listing-switches "-aBhl --group-directories-first"))

  (define-key evil-normal-state-map (kbd "M-5") "[")
  ;; (setq debug-on-error t)
  ;; on signale à emacs l'emplacement des plugins
  (setq-default flycheck-emacs-lisp-load-path 'inherit)


  (setq user-full-name "thomas guesnon")
  (setq user-mail-address "bonjour@thomasguesnon.fr")

  ;; default path for file creation
  (setq default-directory "~/Documents/")
  (setq org-directory "~/Dropbox/org/")


  (org-roam-db-autosync-mode)

  (setq make-backup-files nil) ; stop creating backup~ files
  (setq auto-save-default nil) ; stop creating #autosave# files

  ;; delete/replace selected text (plutôt que de le placer après, ce qui me fait enrager)
  (setq dired-hide-details-mode t)
;;  (setq ls-lisp-dirs-first t)


  (delete-selection-mode 1)

  (show-paren-mode 1)
  ;; (setq powerline-default-separator 'utf-8) ;; https://emacs.stackexchange.com/questions/31860/spacemacs-modeline-color-mismatch
  ;; https://emacs.stackexchange.com/questions/31860/spacemacs-modeline-color-mismatch; when a file is updated outside emacs, make it update if it's already opened in emacs
  (global-auto-revert-mode 1)

  (require 'org-protocol)
  (require 'sqlite3)
  ;; --------
  ;; PACKAGES
  ;; --------
  (global-set-key (kbd "TAB") 'yas-expand)
  (add-to-list 'load-path "~/.emacs.d/plugins/") 

  ;; packages repos
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

  ;; évite à Emacs d'ouvrir les nouvelles windows verticalement dans org-agenda
  (defadvice org-agenda (around split-vertically activate)
    (let ((split-width-threshold 80))  ; or whatever width makes sense for you
      ad-do-it))

  (require 'terminal-here)

  (setq terminal-here-mac-terminal-command 'iterm2)


  ;; --------
  ;; ORG-MODE
  ;; --------
  (with-eval-after-load 'org
    ;; Install package org-plus-contrib for org
    ;; :ensure org-plus-contrib
    ;; Install from 'org' package archive
    ;; :pin gnu
    ;; Load org in org-mode
    ;; :mode (("\\.org$" . org-mode))
    ;; Bind keys
    ;; :bind (("C-c c" . org-capture)
  	;; ("C-c l" . org-store-link)
  	;; ("C-c a" . org-agenda))
    ;; Configure org
    ;; config (progn
      '(require 'ox-gfm nil t)
	  ;; org refile mechanism
  (set-face-attribute 'org-level-1 nil :height 1.0)
  (set-face-attribute 'org-level-2 nil :height 1.0)
  (set-face-attribute 'org-level-3 nil :height 1.0)
  (set-face-attribute 'org-level-4 nil :height 1.0)
  (set-face-attribute 'org-level-5 nil :height 1.0)
  (set-face-attribute 'org-level-6 nil :height 1.0)
  (set-face-attribute 'org-level-7 nil :height 1.0)
  (set-face-attribute 'org-document-title nil :height 1.0)

  ;; ----------------
  ;; CUSTOM VARIABLES
  ;; ----------------
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(doc-view-continuous t)
   '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
   '(helm-completion-style 'emacs)
   '(org-agenda-custom-commands
     '(("x" "Tags dans links/docs/notes-pro/wishlist" tags ""
        ((org-agenda-files
	        `(,(concat org-directory "links.org")
	          ,(concat org-directory "travail_notes.org")
	          ,(concat org-directory "perso_notes.org")
	          ,(concat org-directory "wishlist.org")))))
       ("n" "Agenda with states"
        ((agenda "" nil)
         (todo "INTR" nil)
         (todo "PROG" nil)
         (todo "NEXT" nil)
         (todo "WAIT" nil))
       nil)))
   '(org-agenda-files
     `(,(concat org-directory "travail.org"),(concat org-directory "perso.org")))
   '(org-agenda-search-view-max-outline-level 1)
   '(org-agenda-text-search-extra-files
     ;; ,(concat org-directory "archive/archive.org")
     `(,(concat org-directory "projets.org_archive")
       ,(concat org-directory "famille.org")
       ,(concat org-directory "inbox.org")
       ,(concat org-directory "links.org")
       ,(concat org-directory "travail_notes.org")
       ,(concat org-directory "perso_notes.org")
       ,(concat org-directory "wishlist.org"))
     )
   '(org-export-with-sub-superscripts nil)
   '(org-id-extra-files t)
   '(org-id-track-globally t)
   '(speedbar-show-unknown-files t)
   '(window-divider-mode nil))

  (add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
  (require 'evil-org)


	(setq org-refile-targets `((,(concat org-directory "famille.org") :maxlevel . 9)
				                       (,(concat org-directory "docs.org") :maxlevel . 9)
				                       (,(concat org-directory "links.org") :maxlevel . 9)
				                       (,(concat org-directory "inbox.org") :maxlevel . 9)
				                       (,(concat org-directory "travail_notes.org") :maxlevel . 9)
				                       (,(concat org-directory "perso_notes.org") :maxlevel . 9)
				                       (,(concat org-directory "visual.org") :maxlevel . 9)
				                       (,(concat org-directory "wishlist.org") :maxlevel . 9)
				                       (,(concat org-directory "projets.org_archive") :maxlevel . 9)
                               (org-agenda-files :maxlevel . 9)))
	  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
	  ;; (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

	  (setq org-refile-use-outline-path 'file)
	  ;; (setq org-refile-targets '((org-agenda-files :level . 1)))

	  ;; html exports
	  (setq org-html-checkbox-type 'html)


  	(setq
  	 org-log-done t
  	 org-log-into-drawer t
  	 org-reverse-note-order t

  	 ;; Speed Commands
  	 org-use-speed-commands t


  	 ;; Enforce TODO dependency chains
  	 org-enforce-todo-dependencies t

  	 ;; Syntax hilighting of code blocks in Org-Babel
  	 org-src-fontify-natively t

  	 ;; Auto-indent of code blocks in Org-Babel
  	 org-src-tab-acts-natively t

  	 ;; Set Org-Files for Agenda
  	 org-archive-location (concat org-directory "archive/archive.org::* %s")

	   ;; column view format
	   ;; org-columns-default-format "%40ITEM(Tâche) %17Effort(Temps prévu){:} %CLOCKSUM(Temps passé) %PRIORITY(p)"
	   org-columns-default-format "%40ITEM(Tâche) %17Effort(Temps prévu){:} %CLOCKSUM(Temps passé)"

  	 ;; Org-Babel execute without confirmation
  	 org-confirm-babel-evaluate nil

  	 ;; Org-Mode Link Search
  	 org-link-search-must-match-exact-headline nil

  	 ;; Default to Boolean Search
  	 org-agenda-search-view-always-boolean t

	   org-agenda-todo-list-sublevels t

  	 ;; Export backends
  	 org-export-backends '(ascii html icalendar latex md org)
  	 org-export-coding-system 'utf-8
  	 org-export-babel-evaluate nil

  	 ;; Include Org Modules
  	 org-modules '(org-habit org-drill)

	   ;; Org-Habit Settings
  	 org-habit-preceding-days 30
  	 org-habit-following-days 3
  	 org-habit-graph-column 80

  	 ;; Setup Org Capture
  	 org-default-notes-file (concat org-directory "inbox.org")

  	 org-capture-templates `(;; inbox
				                     ("i" "Inbox" entry (file, (concat org-directory "inbox.org"))
				                      "* %^{Titre}\n \n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

				                     ("t"
				                      "Travail"
				                      entry (file, (concat org-directory "travail.org"))  ;; pour une tâche pro
  				                    "* TODO [#B] %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
  				                    :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

				                     ;; une tâche perso
				                     ("p"
				                      "Perso"
				                      entry (file , (concat org-directory "perso.org"))
				                      "* TODO [#B] %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

	                           ;; un item de wishlist
				                     ("w"
				                      "à lire/voir/entendre"
				                      entry (file, (concat org-directory "wishlist.org"))
				                      "* TODO %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

				                     ;; un groupe/compositeur/interprète
				                     ("u"
				                      "musique à écouter"
				                      entry (file, (concat org-directory "wishlist.org"))
				                      "* TODO %^{Titre} :musique: \n:PROPERTIES:\n:Created: %U\n:END:"
			                        :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

                             ("d"
				                      "Documentation"
				                      entry (file, (concat org-directory "docs.org"))  ;; pour une tâche pro
  				                    "* TODO [#B] %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
  				                    :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

                             ;; ("c" "Contacts" entry (file, (concat org-directory "contacts.org"))
                              ;; "* %(org-contacts-template-name)
;; :PROPERTIES:
;; :EMAIL: %(org-contacts-template-email)
;; :END:")

				                     ;; un lien
				                     ("l"
				                      "Lien"
				                      entry (file, (concat org-directory "links.org"))
				                      "* %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t :kill-buffer t :empty-lines 1)
				                     ))


	  (setq org-todo-keywords
		      '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "CANCELED(c)" "WAIT(w)" "DONE(d)")))

	  ;; Show the daily agenda by default.
	  (setq org-agenda-span 'day)

    ;; customize item display in agenda
    (setq org-agenda-prefix-format '((todo . "%c : %b % s")
                                     (tags . "%c : %b % s")
                                     (search . "%c : %b % s")
                                     (agenda . "%c : %b % s")))

	  ;; Use "second" instead of "day" for time comparison.
	  ;; It hides tasks with a scheduled time like "<2020-11-15 Sun 11:30>"
	  (setq org-agenda-todo-ignore-time-comparison-use-seconds t)

	  ;; Hide the deadline prewarning prior to scheduled date.
	  (setq org-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)

    )



;; permet de définir la journée de travail à 8 heures dans org-mode
;; <https://emacs.stackexchange.com/questions/51114/set-org-duration-units-for-org-mode-scheduling#tab-top>
(use-package org-duration
  :config
  ;; permet d'afficher le temps passé en hours:minutes seulement (et pas en day:hour:minutes, comme par défaut)
  ;; les lignes commentées en dessous, permettent tout de même de configurer 1 day=8heures, ce qui donne quelque chose de cohérent si jamais on veut repasser au format day:hour:minutes
  ;; (setq org-duration-format (quote h:mm))
  (setq org-duration-units   `(("min" . 1)
			                         ("h" . 60)
			                         ("d" . ,(* 60 7))
			                         ("w" . ,(* 60 7 5))
			                         ("m" . ,(* 60 7 5 4))
			                         ("y" . ,(* 60 7 5 4 11))))
  (org-duration-set-regexps)
  )


;; ----------------
;; ORG-PUBLISH
;; ----------------
(require 'ox-publish)
(setq org-publish-project-alist
      '(
	      ("Projects"
	       :base-directory (concat org-directory "gestion_projets/")
	       :base-extension "org"
	       :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	       :recursive nil
	       :publishing-function org-html-publish-to-html
	       :headline-levels 4             ; Just the default for this project.
	       :auto-preamble t
         :with-date nil
         :with-author nil
         :html-validation-link nil
	       )
        ("server-notes"
	       :base-directory org-directory
	       :base-extension "org"
	       ;; :publishing-directory "~/public_html/"
	       :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	       :recursive nil
	       :exclude "perso.org\\|travail.org\\|projets.org_archive\\|famille.org\\|ecrire.org\\|travail.org\\|perso.org\\|inbox.org\\|son.org"
	       :publishing-function org-html-publish-to-html
	       :headline-levels 4             ; Just the default for this project.
	       :auto-preamble t
	       )
	      ("server-static"
	       :base-directory org-directory 
	       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	       ;; :publishing-directory "~/public_html/"
	       :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	       :recursive t
	       :publishing-function org-publish-attachment
	       )
	      ("server" :components ("server-notes" "server-static"))
	      ("local-notes"
	       :base-directory org-directory
	       :base-extension "org"
	       :publishing-directory "~/public_html/"
	       :recursive nil
	       :exclude "perso.org\\|travail.org\\|projets.org_archive\\|famille.org\\|ecrire.org\\|travail.org\\|perso.org\\|inbox.org\\|son.org"
	       :publishing-function org-html-publish-to-html
	       :headline-levels 4             ; Just the default for this project.
	       :auto-preamble t
	       )
	      ("local-static"
	       :base-directory org-directory 
	       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	       :publishing-directory "~/public_html/"
	       :recursive t
	       :publishing-function org-publish-attachment
	       )
	      ("local" :components ("local-notes" "local-static"))
	      ))


;; --------
;; MU4E
;; --------
;; pour la lecture des mails, c'est effecuté avec Gnus depuis la version 1.6 de mu4e
;; Voir la partie GNUS de ce fichier pour le formatage

;; mu4e - pour que M-x mu4e fonctionne !
;; Etonnant, il faut aussi appeler mu4e pour que org-agenda fonctionn
;; (add-to-list 'load-path "~/.emacs.d/plugins/mu4e")
;; (require 'mu4e)
;; (require 'mu4e-contrib)
;; (require 'org-mu4e)
;; (setq mail-personal-alias-file (expand-file-name "~/.mailrc"))
;; ;; (setq mu4e-view-html-plaintext-ratio-heuristic most-positive-fixnum)
;; ;; (setq mu4e-org-contacts-file  (concat org-directory "contacts.org"))
;; (setq mu4e-attachment-dir "~/Downloads")

;; ;; relatif au message view avec gnus
;; (setq gnus-unbuttonized-mime-types nil)
;; (setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;; (setq mu4e-view-prefer-html nil)
;; (setq mu4e-view-show-images nil)
;; (setq mu4e-show-images nil)
;; (setq mu4e-confirm-quit nil)

;; (setq auth-source-debug t)
;; (setq auth-source-do-cache nil)

;; (setq mu4e-update-interval 300)
;; (setq mu4e-compose-dont-reply-to-self t)
;; (setq mu4e-compose-signature-auto-include t)
;; (setq message-kill-buffer-on-exit t)

;; (defun insert-mu4e-sig-here ()
;;   "Insert the mu4e signature here, assuming it is a string."
;;   (interactive)
;;   (save-excursion
;;     (when (stringp mu4e-compose-signature)
;;       (insert mu4e-compose-signature))))

;; (add-hook 'mu4e-compose-mode-hook 'insert-mu4e-sig-here)

;; (setq mu4e-headers-show-threads nil)

;; ;; (setq mu4e-org-contacts-file  (concat org-directory "contacts.org"))

;; (add-to-list 'mu4e-headers-actions
;; 	     '("org-contact-add" . mu4e-action-add-org-contact) t)
;; (add-to-list 'mu4e-view-actions
;; 	     '("org-contact-add" . mu4e-action-add-org-contact) t)

;; (setq mu4e-headers-fields
;;       '((:human-date    .  30)    ;; alternatively, use :human-date
;; 	(:subject       .  80)
;; 	(:flags         .   6)
;; 	(:from          .  30)
;; 	(:to            .  30)
;; 	(:size          .  6)
;; 	(:maildir       .  15)))


;; (setq mu4e-headers-date-format "%a %d %b %Y, %H:%M")

;; ;; Function to interactively prompt for a destination (minimally changed from mu4e~mark-get-move-target() )
;; (defun my~mark-get-copy-target ()
;;    "Ask for a copy target, and propose to create it if it does not exist."
;;    (interactive)
;;    ;;  (mu4e-message-at-point) ;; raises error if there is none
;;    (let* ((target (mu4e-ask-maildir "Copy message to: "))
;;       (target (if (string= (substring target 0 1) "/")
;;             target
;;             (concat "/" target)))
;;       (fulltarget (concat mu4e-maildir target)))
;;     (when (or (file-directory-p fulltarget)
;;         (and (yes-or-no-p
;;            (format "%s does not exist.  Create now?" fulltarget))
;;           (mu4e--server-mkdir fulltarget)))
;;       target)))

;; ;; Function to duplicate a message given by its docid, msg, and that will be copied to target when the mark is executed.
;; (defun copy-message-to-target(docid msg target)
;;   (let (
;;         (new_msg_path nil) ;; local variable
;;         (msg_flags (mu4e-message-field msg :flags))
;;         )
;;     ;; 1. target is already determined interactively when executing the mark (:ask-target)

;;     ;; 2. Determine the path for the new file: we use mu4e~draft-message-filename-construct from
;;     ;; mu4e-draft.el to create a new random filename, and append the original's msg_flags
;;     (setq new_msg_path (format "%s/%s/cur/%s" mu4e-maildir target (mu4e~draft-message-filename-construct
;;     (mu4e-flags-to-string msg_flags))))

;;     ;; 3. Copy the message using file system call (copy-file) to new_msg_path:
;;     ;; (See e.g. mu4e-draft.el > mu4e-draft-open > resend)
;;     (copy-file (mu4e-message-field msg :path) new_msg_path)

;;     ;; 4. Add the information to the database (may need to update current search query with 'g' if duplicating to current box. Try also 'V' to toggle the display of duplicates) 
;;     (mu4e--server-add new_msg_path (mu4e--mark-check-target target))
;;     )
;;   )

;; ;; Set this up for marking: see https://www.djcbsoftware.nl/code/mu/mu4e/Adding-a-new-kind-of-mark.html
;; (add-to-list 'mu4e-marks
;;     '(copy
;;      :char ("c" . "c")
;;      :prompt "copy"
;;      :ask-target  my~mark-get-copy-target
;;      :action copy-message-to-target))
;; (mu4e~headers-defun-mark-for copy)
;; (define-key mu4e-headers-mode-map (kbd "c") 'mu4e-headers-mark-for-copy)

;; ;; Configure desktop notifs for incoming emails:
;; (use-package mu4e-alert
;;   :ensure t
;;   :init
;;   (defun perso--mu4e-notif ()
;;     "Display both mode line and desktop alerts for incoming new emails."
;;     (interactive)
;;     (mu4e-update-mail-and-index 1)        ; getting new emails is ran in the background
;;     (mu4e-alert-enable-mode-line-display) ; display new emails in mode-line
;;     (mu4e-alert-enable-notifications))    ; enable desktop notifications for new emails
;;   (defun perso--mu4e-Refresh ()
;;     "refresh emails every 300 seconds and display desktop alerts."
;;     (interactive)
;;     (mu4e t)                            ; start silently mu4e (mandatory for mu>=1.3.8)
;;     (run-with-timer 0 300 'perso--mu4e-notif))
;;   :after mu4e
;;   :bind ("<f2>" . perso--mu4e-refresh)  ; F2 turns Emacs into a mail client
;;   :config
;;   ;; Mode line alerts:
;;   (add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
;;   ;; Desktop alerts:
;;   (mu4e-alert-set-default-style 'libnotify)
;;   (add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
;;   ;; Only notify for "interesting" (non-trashed) new emails:
;;   (setq mu4e-alert-interesting-mail-query
;;         (concat
;;          "flag:unread maildir:/INBOX"
;;          " AND NOT flag:trashed"))); 

;; ;; smtp config
;; (require 'smtpmail)

;; ;; (setq send-mail-function 'smtpmail-send-it)
;; ;; (setq smtpmail-stream-type 'ssl)
;; (setq sendmail-program "/opt/homebrew/bin/msmtp"
;;       send-mail-function 'smtpmail-send-it
;;       message-sendmail-f-is-evil t
;;       message-sendmail-extra-arguments '("--read-envelope-from")
;;       message-send-mail-function 'message-send-mail-with-sendmail)

;; (setq mu4e-contexts
;;       `( ,(make-mu4e-context
;; 	   :name "bonjour@thomasquesnon.fr"
;; 	   :enter-func (lambda () (mu4e-message "Bienvenue dans bonjour"))
;;            :leave-func (lambda () (mu4e-message "On quitte bonjour"))
;; 	   :match-func (lambda (msg) (when msg
;; 				       (string-prefix-p "^/bonjour" (mu4e-message-field msg :maildir))))
;; 	   :vars '(
;; 		   (mu4e-sent-folder             . "/bonjour/Sent")
;; 		   (mu4e-drafts-folder           . "/bonjour/Drafts")
;; 		   (mu4e-trash-folder            . "/bonjour/Trash")
;; 		   ;; (mu4e-refile-folder "/bonjour/INBOX.Archive")
;; 		   (user-mail-address            . "bonjour@thomasguesnon.fr")
;; 		   (mu4e-compose-signature       . t)
;; 		   (mu4e-compose-signature-auto-include . t)
;; 		   (message-signature-file       . "~/sig-thomas")
;; 		   ;; (smtpmail-smtp-user           . "bonjour@thomasguesnon.fr")
;; 		   (user-full-name               . "Thomas Guesnon")
;; 		   ;; (smtpmail-default-smtp-server . "ssl0.ovh.net")
;; 		   ;; (smtpmail-smtp-server         . "ssl0.ovh.net")
;; 		   (smtpmail-smtp-service        . 465)
;; 		   (mu4e-maildir-shortcuts . (("/bonjour/INBOX" . ?i)
;; 					      ("/bonjour/Sent" . ?s)
;; 					      ("/bonjour/Drafts" . ?d)
;;                 ("/bonjour/Trash" . ?t)
;; 					      ))
;; 		   (mu4e-bookmarks . (("maildir:/bonjour/INBOX AND flag:unread" "Non-lus" ?u)))
;; 		   ;; (add-to-list 'mu4e-bookmarks
;; 		   ;; 		(make-mu4e-bookmark
;; 		   ;; 		 :name "Unread in bonjour"
;; 		   ;; 		 :query "maildir:/bonjour/INBOX AND flag:unread"
;; 		   ;; 		 :key ?v))
;; 		   ))
;;          ,(make-mu4e-context
;; 	   :name "webadmin@kernavelo.org"
;; 	   :enter-func (lambda () (mu4e-message "Bienvenue dans webadmin"))
;;            :leave-func (lambda () (mu4e-message "On quitte webadmin"))
;; 	   :match-func (lambda (msg) (when msg
;; 				       (string-prefix-p "^/kernavelo-webadmin" (mu4e-message-field msg :maildir))))
;; 	   :vars '(
;; 		         (mu4e-sent-folder             . "/kernavelo-webadmin/&AMk-l&AOk-ments envoy&AOk-s")
;; 		   (mu4e-drafts-folder           . "/kernavelo-webadmin/Brouillons")
;; 		   (mu4e-trash-folder            . "/kernavelo-webadmin/&AMk-l&AOk-ments supprim&AOk-s")
;; 		   ;; (mu4e-refile-folder "/kernavelo-webadmin/INBOX.Archive")
;; 		   (user-mail-address            . "webadmin@kernavelo.org")
;; 		   (mu4e-compose-signature       . t)
;; 		   (mu4e-compose-signature-auto-include . t)
;; 		   ;; (message-signature-file       . "~/sig-thomas")
;; 		   (user-full-name               . "Web admin Kernavélo")
;; 		   (smtpmail-smtp-service        . 465)
;; 		   (mu4e-maildir-shortcuts . (("/kernavelo-webadmin/INBOX" . ?i)
;; 					                        ("/kernavelo-webadmin/&AMk-l&AOk-ments envoy&AOk-s" . ?s)
;; 					                        ("/kernavelo-webadmin/Brouillons" . ?d)
;;                                   ("/kernavelo-webadmin/&AMk-l&AOk-ments supprim&AOk-s" . ?t)
;; 					      ))
;; 		   (mu4e-bookmarks . (("maildir:/kernavelo-webadmin/INBOX AND flag:unread" "Non-lus" ?u)))
;; 		   ;; (add-to-list 'mu4e-bookmarks
;; 		   ;; 		(make-mu4e-bookmark
;; 		   ;; 		 :name "Unread in bonjour"
;; 		   ;; 		 :query "maildir:/kernavelo-webadmin/INBOX AND flag:unread"
;; 		   ;; 		 :key ?v))
;; 		   ))
;;            ;;    ,(make-mu4e-context
;;            ;; :name "thomas.guesnon@netcourrier.com"
;;            ;; :enter-func (lambda () (mu4e-message "Change pour Netcourrier/Mailo"))
;;            ;; ;; leave-fun not defined
;;            ;; :match-func (lambda (msg)
;;            ;;   (when msg
;;            ;;     (mu4e-message-contact-field-matches msg
;;            ;;       :to "thomas.guesnon@netcourrier.com")))
;;            ;; :vars '(  ( user-mail-address      . "thomas.guesnon@netcourrier.com" )
;; 		       ;;           (mu4e-maildir-shortcuts . ())
;;            ;;           (mu4e-maildir-shortcuts . (("/netcourrier/INBOX" . ?i)
;; 					 ;;                                      ;; ("/netcourrier/Sent" . ?s)
;; 					 ;;                                      ;; ("/netcourrier/Drafts" . ?d)
;;            ;;                                      ;; ("/netcourrier/Trash" . ?t)
;; 					 ;;                                      ))
;; 		       ;;           (mu4e-bookmarks . (("maildir:/netcourrier/INBOX AND flag:unread" "Non-lus" ?u)))
;;            ;;        ( user-full-name     . "Thomas Guesnon" )))
;;    ))

;; ;; use macos contacts into emacs
;; ;; https://codeisgreat.org/notes/emacs-macos-contacts.html
;; ;; type C-c TAB when marker is in TO field
;; (when (eq system-type 'darwin)
;; 	(eval-and-compile (require 'eudcb-macos-contacts))
;; 	(eudc-macos-contacts-set-server "localhost"))
;; (eval-when-compile (require 'message))
;; (define-key message-mode-map
;; 	[(control ?c) (tab)] 'eudc-expand-inline)
;; (eval-when-compile (require 'sendmail))
;; (define-key mail-mode-map
;; 	[(control ?c) (tab)] 'eudc-expand-inline)

;; ;; start with the first (default) context;
;; ;; default is to ask-if-none (ask when there's no context yet, and none match)
;; (setq mu4e-context-policy 'pick-first)

;; ;; compose with the current context is no context matches;
;; ;; default is to ask
;; (setq mu4e-compose-context-policy nil)

;; ;; lires les mails html dans le browser de'emacs (eww)
;; ;; source : https://irreal.org/blog/?p=9587
;; (defun jcs-view-in-eww (msg)
;;   "Display current message in EWW browser."
;;   (eww-browse-url (concat "file://" (mu4e~write-body-to-html msg))))

;; --------------
;; THEME CHANGER
;; --------------
;; (setq calendar-location-name "Rennes, FR") 
;; (setq calendar-latitude 48.11)
;; (setq calendar-longitude -1.68)

;; (require 'theme-changer)
;; (change-theme 'spacemacs-light 'spacemacs-dark)

;; --------
;; MAGIT
;; --------

;; --------
;; CALENDAR
;; --------

(add-hook 'calendar-load-hook
	        (lambda ()
	          (calendar-set-date-style 'european)))

(setq calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
			                         "Jeudi" "Vendredi" "Samedi"]
      calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
				                         "Juin" "Juillet" "Août" "Septembre"
				                         "Octobre" "Novembre" "Décembre"])

;;---------------------
;; FRINGES
;;---------------------
;; Huuu, pour avoir de grosses marges de chaque côté de l'écran
;; From https://bzg.fr/en/emacs-strip-tease.html/

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


;; From https://blog.aaronbieber.com/2016/03/05/playing-tag-in-org-mode.html
(defun air--org-swap-tags (tags)
  "Replace any tags on the current headline with TAGS.
The assumption is that TAGS will be a string conforming to Org Mode's
tag format specifications, or nil to remove all tags."
  (let ((old-tags (org-get-tags-string))
        (tags (if tags
                  (concat " " tags)
                "")))
    (save-excursion
      (beginning-of-line)
      (re-search-forward
       (concat "[ \t]*" (regexp-quote old-tags) "[ \t]*$")
       (line-end-position) t)
      (replace-match tags)
      (org-set-tags t))))
(defun air-org-set-tags (tag)
  "Add TAG if it is not in the list of tags, remove it otherwise.
TAG is chosen interactively from the global tags completion table."
  (interactive
   (list (let ((org-last-tags-completion-table
                (if (derived-mode-p 'org-mode)
                    (org-uniquify
                     (delq nil (append (org-get-buffer-tags)
                                       (org-global-tags-completion-table))))
                  (org-global-tags-completion-table))))
           (org-icompleting-read
            "Tag: " 'org-tags-completion-function nil nil nil
            'org-tags-history))))
  (let* ((cur-list (org-get-tags))
         (new-tags (mapconcat 'identity
                              (if (member tag cur-list)
                                  (delete tag cur-list)
                                (append cur-list (list tag)))
                              ":"))
         (new (if (> (length new-tags) 1) (concat " :" new-tags ":")
                nil)))
    (air--org-swap-tags new)))

;;;; Override default org-set-tags keybindings (C-c C-q and C-c C-c on a headline) to use air-org-set-tags.
(defun air-org-set-tags-ctrl-c-ctrl-c-hook ()
  (let* ((context (org-element-context))
         (type (org-element-type context)))
    (if (or (eq type 'headline)
            (eq type 'inlinetask))
        (save-excursion (goto-char (org-element-property :begin context))
                        (call-interactively #'air-org-set-tags)
                        t)
      nil)))
(add-hook 'org-ctrl-c-ctrl-c-hook #'air-org-set-tags-ctrl-c-ctrl-c-hook)
(org-defkey org-mode-map (kbd "C-c C-q") #'air-org-set-tags)


;; count tags in org-mode
(defun count-tags ()
  (let (tags count)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward org-complex-heading-regexp nil t)
        (dolist (tag (org-get-tags))
          (push tag tags)))
      (cl-loop with result
               for tag in tags
               do (push (list (cl-count tag tags
                                        :test #'string=)
                              tag)
                        count)
               collect
               (setq result (cl-remove-duplicates count
                                                  :test #'equal))
               finally return
               (cl-sort result #'> :key #'car)))))

;; LilyPond mode
(add-to-list 'load-path "~/.emacs.d/plugins/lilypond-init.el")
(autoload 'LilyPond-mode "lilypond-mode")

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; ---------------
;; PANDOC/MARKDOWN
;; ---------------
(setq markdown-command "/opt/homebrew/bin/pandoc")
(setq markdown-xhtml-header-content "<meta http-equiv='Content-Type' content='text/html' charset='utf-8' /><link rel='stylesheet' media='all' href='/var/www/html/Jypi/public/css/all.css'><style type='text/css'>body{padding: 32px;}</style>"   ) ;; on ajoute l'encodage et la feuille de style, pour que ce soille bô !

;; -----------------
;; ARDUINO MODE
;; -----------------
(add-to-list 'load-path "~/.emacs.d/plugins/arduino-mode")
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; ---------------
;; EMACS TRR
;; ---------------

;; -------------
;; YAML
;; -------------

;; -------------
;; BOOKMARKS
;; -------------
(setq bookmark-default-file "~/.emacs.d/bookmarks") ;; fichier accuillant les bookmarks


;; ------------
;; PRINTING
;; ------------
;; 2 column landscape size 7 prints column 0-78, lines 1 to 70
(setq ps-paper-type 'a4
      ps-font-size 9.0
      ps-print-header nil
      ps-number-of-columns 1)

;; -------------
;; CODE SNIPPETS
;; -------------

;; --------
;; ELECTRIC PAIR
;; --------
;; Auto-close parenthesis, bracket, curly-brackets, etc. related to current major-mode
(electric-pair-mode t)

;; visual-line-mode activé pour les fichiers markdown
;; texte-en drapeau, et non coupé au caractère i.e. plus lisible

(add-hook 'markdown-mode-hook (lambda ()
				                        (visual-line-mode t)))

(add-hook 'org-mode-hook (lambda ()
			                     (visual-line-mode t)))

;; ------------
;; MODES
;; ------------
(setq auto-mode-alist (cons '("\\.\\(pde\\|ino\\)$" . arduino-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq auto-mode-alist (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript - tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)

;; ---------------
;; BIBTEX
;; ---------------
(setq bibtex-completion-bibliography '("~/Dropbox/papers/references.bib")
      ;; helm-bibtex-bibliography '("~/Dropbox/papers/references.bib")
      bibtex-completion-library-path '("~/Dropbox/papers/pdf_papers" "~/Dropbox/papers/pdf_books")
      bibtex-completion-notes-path "~/Dropbox/papers/notes.org")
(setq bibtex-completion-pdf-field "file")
;; (setq bibtex-completion-pdf-open-function
      ;; (lambda (fpath)
        ;; (debug)
        ;; (message fpath)
        ;; (start-process "open" "*open*" "open" fpath)))
;; (setq bibtex-completion-pdf-open-function (fpath))
;; (setq bibtex-completion-pdf-open-function 'helm-open-file-with-default-tool)
;; (setq org-ref-get-pdf-filename-function
      ;; (lambda (key) (car (bibtex-completion-find-pdf key))))

;; https://github.com/jkitchin/org-ref/issues/184
(defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results)))
    (funcall bibtex-completion-pdf-open-function (car (bibtex-completion-find-pdf key)))))

(setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point)
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doc-view-continuous t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(helm-completion-style 'emacs)
 '(org-agenda-custom-commands
   '(("x" "Tags dans links/docs/notes-pro/wishlist" tags ""
      ((org-agenda-files
        `(,(concat org-directory "links.org")
          ,(concat org-directory "travail_notes.org")
          ,(concat org-directory "perso_notes.org")
          ,(concat org-directory "wishlist.org")))))
     ("n" "Agenda with states"
      ((agenda "" nil)
       (todo "INTR" nil)
       (todo "PROG" nil)
       (todo "NEXT" nil)
       (todo "WAIT" nil))
      nil)))
 '(org-agenda-files
   `(,(concat org-directory "travail.org")
     ,(concat org-directory "perso.org")))
 '(org-agenda-search-view-max-outline-level 1)
 '(org-agenda-text-search-extra-files
   `(,(concat org-directory "projets.org_archive")
     ,(concat org-directory "famille.org")
     ,(concat org-directory "inbox.org")
     ,(concat org-directory "links.org")
     ,(concat org-directory "travail_notes.org")
     ,(concat org-directory "perso_notes.org")
     ,(concat org-directory "wishlist.org")))
 '(org-export-with-sub-superscripts nil)
 '(org-id-extra-files t)
 '(org-id-track-globally t)
 '(package-selected-packages
   '(afternoon-theme alect-themes ample-theme ample-zen-theme anti-zenburn-theme apropospriate-theme badwolf-theme birds-of-paradise-plus-theme bubbleberry-theme busybee-theme cherry-blossom-theme chocolate-theme clues-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow cyberpunk-theme dakrone-theme darkmine-theme darkokai-theme darktooth-theme django-theme doom-themes dracula-theme espresso-theme exotica-theme eziam-themes farmhouse-themes flatland-theme flatui-theme gandalf-theme gotham-theme grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme hemisu-theme heroku-theme inkpot-theme ir-black-theme jazz-theme jbeans-theme kaolin-themes light-soap-theme lush-theme madhat2r-theme majapahit-themes material-theme minimal-theme modus-themes moe-theme molokai-theme monochrome-theme monokai-theme mustang-theme naquadah-theme noctilux-theme obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme organic-green-theme phoenix-dark-mono-theme phoenix-dark-pink-theme planet-theme professional-theme purple-haze-theme railscasts-theme rebecca-theme reverse-theme seti-theme smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme autothemer spacegray-theme subatomic-theme subatomic256-theme sublime-themes sunny-day-theme tango-2-theme tango-plus-theme tangotango-theme tao-theme toxi-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme underwater-theme white-sand-theme zen-and-art-theme zenburn-theme zonokai-emacs graphviz-dot-mode theme-changer xah-fly-keys sqlite3 django-mode org-contacts org-vcard org-superstar yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum which-key web-mode web-beautify volatile-highlights vim-powerline vi-tilde-fringe uuidgen use-package undo-tree treemacs-projectile treemacs-persp treemacs-magit treemacs-icons-dired treemacs-evil toc-org tern terminal-here term-cursor tagedit symon symbol-overlay string-edit-at-point sql-indent sphinx-doc spacemacs-whitespace-cleanup spacemacs-purpose-popwin spaceline-all-the-icons space-doc smeargle slim-mode shell-pop seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters quickrun pytest pylookup pyenv-mode pydoc py-isort pug-mode prettier-js popwin poetry pippel pipenv pip-requirements phpunit phpcbf php-extras php-auto-yasnippets password-generator paradox overseer orgit-forge org-roam-ui org-roam-bibtex org-rich-yank org-ref org-projectile org-present org-pomodoro org-mime org-download org-contrib org-cliplink open-junk-file npm-mode nose nodejs-repl nameless multi-vterm multi-term multi-line mu4e-maildirs-extension mu4e-alert minitest macrostep lorem-ipsum livid-mode live-py-mode link-hint json-reformat json-navigator json-mode js2-refactor js-doc inspector info+ indent-guide importmagic impatient-mode hybrid-mode hungry-delete holy-mode hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-org helm-mu helm-mode-manager helm-make helm-ls-git helm-git-grep helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-bibtex helm-ag google-translate golden-ratio gnuplot gitignore-templates git-timemachine git-modes git-messenger git-link geben fuzzy font-lock+ flycheck-package flycheck-elsa flx-ido fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-evilified-state evil-escape evil-easymotion evil-collection evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emr emmet-mode elisp-slime-nav elisp-def editorconfig dumb-jump drupal-mode drag-stuff dotenv-mode dired-quick-sort diminish devdocs deft define-word cython-mode csv-mode company-web company-phpactor company-php company-anaconda column-enforce-mode code-cells clean-aindent-mode chruby centered-cursor-mode bundler blacken auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-link ace-jump-helm-line ac-ispell))
 '(speedbar-show-unknown-files t)
 '(warning-suppress-log-types '((use-package)))
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-1 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-2 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-3 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-4 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-5 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-7 ((t (:inherit bold :extend nil :weight bold :height 1.0))))
 '(org-level-8 ((t (:inherit bold :extend nil :weight bold :height 1.0)))))
)
