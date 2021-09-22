;; add MELPA package server
(package-initialize)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(unless package-archive-contents
  (package-refresh-contents))


;; if not yet installed, install package use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Theme
(use-package gruvbox-theme
  :init (load-theme 'gruvbox t))

; (setq comp-deferred-compilation t)
; (setq package-native-compile t)
; (setq comp-async-report-warnings-errors nil)

;; load org package and our emacs-config.org file
(require 'org)
(org-babel-load-file (expand-file-name "~/dotfiles/settings.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" default))
 '(package-selected-packages
   '(corfu consult orderless marginalia vertico lorem-ipsum pug-mode elfeed org-download which-key zetteldeft deft company visual-regexp-steroids visual-regexp emojify olivetti lsp-ivy lsp-ui exec-path-from-shell lsp-mode vue-mode yasnippet evil-vimish-fold vimish-fold ace-window evil-goggles evil-numbers diminish smart-mode-line-powerline-theme avy org-plus-contrib counsel-projectile projectile magit ivy-hydra counsel ivy smex ranger drag-stuff general evil gruvbox-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit diff-removed))))
 '(evil-goggles-yank-face ((t (:inherit region))))
 '(link ((t (:foreground "light green" :underline t))))
 '(org-scheduled-previously ((t (:foreground "#ff00cc"))))
 '(region ((t (:background "#94765A"))))
 '(secondary-selection ((t (:background "#836D62" :foreground "black")))))
(put 'narrow-to-region 'disabled nil)
