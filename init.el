(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '("~/code/emacs/")
   dotspacemacs-configuration-layers
   '(
     helm
     ivy
     (python :variables
             python-test-runner '(nose pytest))
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t)

     emacs-lisp
     dash
     github
     chrome
     markdown
     org
     prodigy
     (clojure :variables clojure-enable-fancify-symbols t)
     search-engine
     ;; version-control
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     (spell-checking :variables spell-checking-enable-by-default nil)
     yaml
     html
     command-log
     javascript
     erlang
     elixir
     (ruby :variables ruby-version-manager 'rbenv)
     (c-c++ :variables c-c++-enable-clang-support t)
     ruby-on-rails
     colors
     ranger
     gtags
     (spacemacs-layouts :variables layouts-enable-autosave nil
                        layouts-autosave-delay 300)
     ;; eyebrowse
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-save-repository-buffers 'dontask
          magit-revert-buffers 'silent
          magit-refs-show-commit-count 'all
          magit-revision-show-gravatars nil)
     (shell :variables
            shell-default-position 'full
            shell-default-shell 'multi-term
            shell-default-term-shell "/bin/zsh")
     (chinese :variables
              chinese-enable-fcitx t
              chinese-enable-youdao-dict t)
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     spacemeow
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-excluded-packages '(spaceline)
   dotspacemacs-download-packages 'used
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(bookmarks projects)
   dotspacemacs-startup-recent-list-size 5
   dotspacemacs-scratch-mode 'emacs-lisp-mode
   dotspacemacs-themes '(
                         solarized-light
                         solarized-dark
                         spacemacs-dark
                         ;; spacemacs-light
                         ;; solarized-light
                         ;; solarized-dark
                         monokai
                         leuven
                         ;; zenburn
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-visual-line-move-text t
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup t
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server t
   dotspacemacs-search-tools '("pt")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  (setq configuration-layer--elpa-archives
        '(("melpa-cn" . "https://elpa.zilongshanren.com/melpa/")
          ("org-cn"   . "https://elpa.zilongshanren.com/org/")
          ("gnu-cn"   . "https://elpa.zilongshanren.com/gnu/")))

  ;; We use fixed-font everywhere.
  (setq solarized-use-variable-pitch nil
        solarized-scale-org-headlines nil)

  ;; https://github.com/syl20bnr/spacemacs/issues/2705
  ;; (setq tramp-mode nil)
  (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
  (setq evil-shift-round nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the Very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (setq mac-option-modifier 'super
        mac-command-modifier 'meta
        mac-command-key-is-meta t
        mac-option-key-is-meta nil
        system-uses-terminfo nil)

  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-mac) window-system)
      (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 16 16)))

  (setq-default powerline-default-separator 'arrow)
  (with-eval-after-load 'helm-swoop
    (define-key helm-swoop-map (kbd "C-w") 'evil-delete-backward-word))

  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'org-mode-hook 'auto-fill-mode)
  (add-hook 'org-mode-hook (lambda () (org-indent-mode t)) t)

  (remove-hook 'emacs-lisp-mode-hook 'auto-compile-mode)
  (spacemacs/toggle-automatic-symbol-highlight-on)
  (spacemacs/set-leader-keys "rh" 'helm-resume)
  (spacemacs/set-leader-keys "ri" 'ivy-resume)
  (company-quickhelp-mode -1)
  (global-set-key (kbd "C-i") 'hippie-expand)
  (setq-default global-visual-line-mode t)

  ;; set configurations for tramp
  (setq tramp-default-user "yct21")

  (set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
  (setq ranger-override-dired t)
  )

(setq custom-file (expand-file-name "custom.el" dotspacemacs-directory))
(load custom-file 'no-error 'no-message)
