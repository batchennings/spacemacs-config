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
   '(php
     python
     csv
     yaml
     ruby
     javascript
     html
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
     git
     helm
     ;; tabs
     ;; lsp
     ;; markdown
     multiple-cursors
     org
     (org :variables
           org-enable-roam-support t
           org-roam-ui-mode t
           org-enable-roam-protocol t)
     ;; org-roam
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
   dotspacemacs-additional-packages '()

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
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("JetBrains Mono"
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
  (define-key evil-normal-state-map (kbd "M-5") "[")

  ;; on signale à emacs l'emplacement des plugins
  (setq-default flycheck-emacs-lisp-load-path 'inherit)

  (setq user-full-name "thomas guesnon")
  (setq user-mail-address "bonjour@thomasguesnon.fr")

  ;; default path for file creation
  (setq default-directory "~/Documents/")
  (setq org-directory "~/Dropbox/org/")

  (setq make-backup-files nil) ; stop creating backup~ files
  (setq auto-save-default nil) ; stop creating #autosave# files

  ;; delete/replace selected text (plutôt que de le placer après, ce qui me fait enrager)
  (setq dired-hide-details-mode t)

  (delete-selection-mode 1)

  (show-paren-mode 1)
  ;; (setq powerline-default-separator 'utf-8) ;; https://emacs.stackexchange.com/questions/31860/spacemacs-modeline-color-mismatch
  ;; https://emacs.stackexchange.com/questions/31860/spacemacs-modeline-color-mismatch; when a file is updated outside emacs, make it update if it's already opened in emacs
  (global-auto-revert-mode 1)

  (require 'org-protocol)

  ;; --------
  ;; PACKAGES
  ;; --------
  (global-set-key (kbd "TAB") 'yas-expand)
  (add-to-list 'load-path "~/.emacs.d/plugins/") 

  ;; packages repos
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  ;; (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  ;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
  ;; (add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)
  ;; (package-initialize)

  ;; Install use-package
  ;; (unless (package-installed-p 'use-package)
  ;; (package-refresh-contents)
  ;; (package-install 'use-package))

  ;; évite à Emacs d'ouvrir les nouvelles windows verticalement dans org-agenda
  (defadvice org-agenda (around split-vertically activate)
    (let ((split-width-threshold 80))  ; or whatever width makes sense for you
      ad-do-it))

  (require 'terminal-here)

  (setq terminal-here-mac-terminal-command 'iterm2)
  ;; ----------------
  ;; CUSTOM VARIABLES
  ;; ----------------

  ;; (add-to-list 'load-path "~/.emacs.d/private/org-roam/")
  ;; (add-to-list 'load-path "~/.emacs.d/private/org-roam/extensions/")
  ;; (require 'org-roam)

  ;; (use-package org-roam
  ;;   :load-path "~/.emacs.d/private/org-roam"
  ;;   :custom
  ;;   (org-roam-directory "~/.emacs.d/private/org-roam") ; replace with your path
  ;;   :bind (("C-c n l" . org-roam-buffer-toggle)
  ;;          ("C-c n f" . org-roam-node-find))
  ;;                                       ; global-page-break-lines-mode will break the org-roam buffer
  ;;   :hook ( org-roam-mode . (lambda () (global-page-break-lines-mode -1)))
  ;;   :config
  ;;   (org-roam-setup))
  (add-to-list 'image-types 'svg) ;; solve a problem raised by launching dired - svg reading in Mac OS Ventura - https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg

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
	        `(,(concat org-directory "notes_links.org")
	          ,(concat org-directory "notes_travail.org")
	          ,(concat org-directory "notes_perso.org")
	          ,(concat org-directory "notes_wishlist.org")))))
       ("n" "Agenda / INTR / PROG / NEXT"
        ((agenda "" nil)
         (todo "INTR" nil)
         (todo "PROG" nil)
         (todo "NEXT" nil))
        nil)))
   '(org-agenda-files
     `(,(concat org-directory "travail.org")
       ,(concat org-directory "perso.org")
       ,(concat org-directory "projets.org")))
   '(org-agenda-search-view-max-outline-level 1)
   '(org-agenda-text-search-extra-files
     `(,(concat org-directory "archive/archive.org")
       ,(concat org-directory "projets_archive.org")
       ,(concat org-directory "notes_famille.org")
       ,(concat org-directory "notes_reference.org")
       ,(concat org-directory "notes_inbox.org")
       ,(concat org-directory "notes_links.org")
       ,(concat org-directory "notes_travail.org")
       ,(concat org-directory "notes_perso.org")
       ,(concat org-directory "notes_wishlist.org"))

     )
   '(org-export-with-sub-superscripts nil)
   '(org-id-extra-files t)
   '(org-id-track-globally t)
   ;; '(package-selected-packages
     ;; '(magit pdf-tools json-reformat json-mode jq-format tabbar htmlize typit wttrin quelpa-use-package quelpa org-ql ivy monkeytype magit chronos chess mu4e-alert evil doom-themes color-theme-sanityinc-tomorrow soothe-theme deft org-journal yaml-mode yasnippet-snippets wrap-region web-mode visual-regexp use-package rjsx-mode processing-mode pomidor php-mode org-vcard org-agenda-property markdown-mode less-css-mode helm-swoop helm-c-yasnippet emms auto-complete))
   '(speedbar-show-unknown-files t)
   '(window-divider-mode nil))

  (set-face-attribute 'org-level-1 nil :height 1.0)
  (set-face-attribute 'org-level-2 nil :height 1.0)
  (set-face-attribute 'org-level-3 nil :height 1.0)
  (set-face-attribute 'org-level-4 nil :height 1.0)
  (set-face-attribute 'org-level-5 nil :height 1.0)
  (set-face-attribute 'org-level-6 nil :height 1.0)
  (set-face-attribute 'org-level-7 nil :height 1.0)
  (set-face-attribute 'org-document-title nil :height 1.0)

  (add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
  (require 'evil-org)

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
	  (setq org-refile-targets `((,(concat org-directory "notes_ecrire.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_famille.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_reference.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_links.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_travail.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_perso.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_wishlist.org") :maxlevel . 9)
				                       (,(concat org-directory "projets_archive.org") :maxlevel . 9)
				                       (,(concat org-directory "notes_son.org") :maxlevel . 9)
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
  	 org-default-notes-file (concat org-directory "notes_inbox.org")

  	 org-capture-templates `(		     ;; inbox
				                     ("i" "Inbox" entry (file, (concat org-directory "notes_inbox.org"))
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
				                      entry (file, (concat org-directory "notes_wishlist.org"))
				                      "* TODO %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

				                     ;; un groupe/compositeur/interprète
				                     ("u"
				                      "musique à écouter"
				                      entry (file, (concat org-directory "notes_wishlist.org"))
				                      "* TODO %^{Titre} :musique: \n:PROPERTIES:\n:Created: %U\n:END:"
			                        :prepend t
				                      :kill-buffer t
				                      :empty-lines 1)

				                     ;; une note d'écriture
				                     ("e"
				                      "Note d'écriture"
				                      entry (file, (concat org-directory "notes_ecrire.org"))
				                      "* %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t :kill-buffer t :empty-lines 1)

				                     ;; un lien
				                     ("l"
				                      "Lien"
				                      entry (file, (concat org-directory "notes_links.org"))
				                      "* %^{Titre}\n:PROPERTIES:\n:Created: %U\n:END:"
				                      :prepend t :kill-buffer t :empty-lines 1)
				                     ))


	  (setq org-todo-keywords
		      '((sequence "TODO(t)" "NEXT(n)" "PROG(p)" "INTR(i)" "CANCELED(c)" "DONE(d)")))

	  ;; Show the daily agenda by default.
	  (setq org-agenda-span 'day)

    ;; customize item display in agenda
    ;; (setq org-agenda-prefix-format '((todo . "%-30b") (tags . "%-30b") (agenda . "%-30b")))
    ;; (setq org-agenda-prefix-format '((todo . "%-30b") (tags . "%-30b") (agenda . "%-30b")))
    ;; (setq org-agenda-prefix-format '((todo . "  %-12:b%?-12t% s") (agenda . "  %-12:b%?-12t% s")))
    ;; (setq org-agenda-prefix-format '((todo . "%c : %b % s") (agenda . "  %-12:b%? t%c %b % s")))
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
	      ("server-notes"
	       :base-directory "~/Dropbox/org/"
	       :base-extension "org"
	       ;; :publishing-directory "~/public_html/"
	       :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	       :recursive nil
	       :exclude "perso.org\\|travail.org\\|projets.org\\|projets_archive.org\\|notes_famille.org\\|notes_ecrire.org\\|notes_travail.org\\|notes_perso.org\\|notes_inbox.org\\|notes_son.org"
	       :publishing-function org-html-publish-to-html
	       :headline-levels 4             ; Just the default for this project.
	       :auto-preamble t
	       )
	      ("server-static"
	       :base-directory "~/Dropbox/org/"
	       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	       ;; :publishing-directory "~/public_html/"
	       :publishing-directory "/ssh:debian@51.210.101.191:/var/www/platform.thomasguesnon.net/org"
	       :recursive t
	       :publishing-function org-publish-attachment
	       )
	      ("server" :components ("server-notes" "server-static"))
	      ("local-notes"
	       :base-directory "~/Dropbox/org/"
	       :base-extension "org"
	       :publishing-directory "~/public_html/"
	       :recursive nil
	       :exclude "perso.org\\|travail.org\\|projets.org\\|projets_archive.org\\|notes_famille.org\\|notes_ecrire.org\\|notes_travail.org\\|notes_perso.org\\|notes_inbox.org\\|notes_son.org"
	       :publishing-function org-html-publish-to-html
	       :headline-levels 4             ; Just the default for this project.
	       :auto-preamble t
	       )
	      ("local-static"
	       :base-directory "~/Dropbox/org/"
	       :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|ttf\\|otf\\|eot"
	       :publishing-directory "~/public_html/"
	       :recursive t
	       :publishing-function org-publish-attachment
	       )
	      ("local" :components ("local-notes" "local-static"))
	      ))


;; --------
;; MAGIT
;; --------
;; (add-hook 'magit-process-find-password-functions
;; 'magit-process-password-auth-source)

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

?;;;; Override default org-set-tags keybindings (C-c C-q and C-c C-c on a headline) to use air-org-set-tags.
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
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "ed5c37f3c823f0b4348e5025707ac40b95dbecd99a67d93cd4416c258eaf75f0" "966a49d899d00211fa2fa652b5f64e106782cd84b30dff4c658eb5d542fce5a1" "7f666327ab76c4cf1bd60d55e2fd17e46ebf44c10df466adc86312089bb3fdfe" "ae30c27916f58eb24285b19d52e2c4ae36b862a3856bbbc5e932f5d436dc7d61" "246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "2c49d6ac8c0bf19648c9d2eabec9b246d46cb94d83713eaae4f26b49a8183fc4" "77113617a0642d74767295c4408e17da3bfd9aa80aaa2b4eeb34680f6172d71a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62
fb50b6d00e8b01c2208e55543a6337433a" default))
 '(doc-view-continuous t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(helm-completion-style 'emacs)
 '(org-agenda-custom-commands
   '(("x" "Tags dans links/docs/notes-pro/wishlist" tags ""
      ((org-agenda-files
        `(,(concat org-directory "notes_links.org")
          ,(concat org-directory "notes_travail.org")
          ,(concat org-directory "notes_perso.org")
          ,(concat org-directory "notes_wishlist.org")))))
     ("n" "Agenda / INTR / PROG / NEXT"
      ((agenda "" nil)
       (todo "INTR" nil)
       (todo "PROG" nil)
       (todo "NEXT" nil))
      nil)))
 '(org-agenda-files
   `(,(concat org-directory "travail.org")
     ,(concat org-directory "perso.org")
     ,(concat org-directory "projets.org")))
 '(org-agenda-search-view-max-outline-level 1)
 '(org-agenda-text-search-extra-files
   `(,(concat org-directory "archive/archive.org")
     ,(concat org-directory "projets_archive.org")
     ,(concat org-directory "notes_famille.org")
     ,(concat org-directory "notes_reference.org")
     ,(concat org-directory "notes_inbox.org")
     ,(concat org-directory "notes_links.org")
     ,(concat org-directory "notes_travail.org")
     ,(concat org-directory "notes_perso.org")
     ,(concat org-directory "notes_wishlist.org")))
 '(org-export-with-sub-superscripts nil)
 '(org-id-extra-files t)
 '(org-id-track-globally t)
 '(org-roam-directory "/Users/patjennings/Dropbox/org-roam")
 '(package-selected-packages
   '(sqlite3 org-roam magit pdf-tools json-reformat json-mode jq-format tabbar htmlize typit wttrin quelpa-use-package quelpa org-ql ivy monkeytype magit chronos chess mu4e-alert evil doom-themes color-theme-sanityinc-tomorrow soothe-theme deft org-journal yaml-mode yasnippet-snippets wrap-region web-mode visual-regexp use-package rjsx-mode processing-mode pomidor php-mode org-vcard org-agenda-property markdown-mode less-css-mode helm-swoop helm-c-yasnippet emms auto-complete))
 '(speedbar-show-unknown-files t)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)

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
;; (add-to-list 'load-path "~/.emacs.d/plugins/emacs-trr")
;; (require 'trr)

;; -------------
;; YAML
;; -------------
;; (require 'yaml-mode)

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
;; (require 'yasnippet)
;; (setq yas-snippet-dirs
;; '("~/.emacs.d/snippets"                 ;; personal snippets
;; ))
;; (yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; Autocomplete
;; (use-package auto-complete
;;   :ensure t
;;   :init
;;   (progn
;;     (ac-config-default)
;;     (global-auto-complete-mode t)
;;     ))

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
