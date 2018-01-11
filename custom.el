;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-safe-themes
   (quote
    ("70b9c3d480948a3d007978b29e31d6ab9d7e259105d558c41f8b9532c13219aa" default)))
 '(evil-want-Y-yank-to-eol t)
 '(hl-sexp-background-color "#efebe9")
 '(package-selected-packages
   (quote
    (elfeed-web elfeed-org elfeed-goodies noflet elfeed tide typescript-mode foreman-mode wgrep stickyfunc-enhance srefactor smex ivy-hydra helm-cscope xcscope flyspell-correct-ivy deft counsel-dash company-ycmd ycmd request-deferred deferred ctable ess julia-mode disaster counsel-projectile counsel swiper ivy company-c-headers cmake-mode clang-format clojure-snippets clj-refactor edn paredit peg cider-eval-sexp-fu cider queue clojure-mode emoji-cheat-sheet-plus company-emoji monokai-theme youdao-dictionary names chinese-word-at-point yaml-mode xterm-color ws-butler window-numbering which-key web-mode web-beautify wakatime-mode volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline powerline smooth-scrolling smeargle slim-mode shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv ranger rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-yapf projectile-rails rake inflections prodigy popwin pip-requirements persp-mode pdf-tools tablist pcre2el paradox spinner pangu-spacing page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-journal org-download org-bullets open-junk-file neotree multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint leuven-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jade-mode info+ indent-guide ido-vertical-mode ibuffer-projectile hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-gtags helm-gitignore request helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode google-translate golden-ratio gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh logito pcache gh-md ggtags flyspell-correct flycheck-pos-tip flycheck flx-ido flx find-by-pinyin-dired fill-column-indicator feature-mode fcitx fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight eshell-z eshell-prompt-extras esh-help erlang engine-mode elisp-slime-nav edit-server diminish define-word dash-at-point cython-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp company-anaconda command-log-mode column-enforce-mode coffee-mode clean-aindent-mode chruby chinese-pyim pos-tip bundler inf-ruby buffer-move bind-map bind-key auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed anaconda-mode pythonic f s alchemist company dash elixir-mode pkg-info epl aggressive-indent adaptive-wrap ace-window ace-pinyin pinyinlib ace-jump-mode ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build spacemacs-theme)))
 '(pyim-dicts
   (quote
    ((:name "BigDict-01" :file "/Users/yct21/.emacs.d/.cache/pyim-bigdict.pyim" :coding utf-8-unix :dict-type pinyin-dict))))
 '(safe-local-variable-values
   (quote
    ((spacemeow-image-path . "/Users/yct21/orlog/images/")
     (spacemeow-image-path . "/Users/yct21/stf/images/")
     (spacemeow-image-path . "~/stf/images/")
     (spacemeow-image-path . ~/stf/images)
     (projectile-test-suffix-function lambda
                                      (project-type)
                                      "" "_test")
     (eval setq spacemeow-image-path
           (concat
            (file-name-directory load-file-name))
           "images/")
     (eval
      (setq spacemeow-image-path
            (concat
             (file-name-directory load-file-name))
            "images/"))
     (evil
      (setq spacemeow-image-path
            (concat
             (file-name-directory load-file-name))
            "images/"))
     (spacemeow-image-path
      (eval
       (concat
        (file-name-directory load-file-name))
       "images/"))
     (spacemeow-image-path . \./images/)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking))))
 '(wakatime-api-key "44bcd124-1fb7-44a3-a7b6-aae4fecc969d"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
