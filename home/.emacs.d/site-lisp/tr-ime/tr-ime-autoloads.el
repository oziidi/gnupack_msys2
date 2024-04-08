;;; tr-ime-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "tr-ime" "tr-ime.el" (0 0 0 0))
;;; Generated autoloads from tr-ime.el

(autoload 'tr-ime-detect-ime-patch-p "tr-ime" "\
Return non-nil if an IME patch seems to be applied to Emacs." nil nil)

(autoload 'tr-ime-standard-install "tr-ime" "\
Install tr-ime standard (stable but less functionality) DLL.

If NO-CONFIRM is non-nil, download the necessary module DLL without
confirming the user.

\(fn &optional NO-CONFIRM)" nil nil)

(autoload 'tr-ime-standard-initialize "tr-ime" "\
Initialize tr-ime standard (stable but less functionality) features." nil nil)

(autoload 'tr-ime-advanced-install "tr-ime" "\
Install tr-ime advanced (experimental but more functionality) DLL.

If NO-CONFIRM is non-nil, download the necessary module DLL without
confirming the user.

\(fn &optional NO-CONFIRM)" nil nil)

(autoload 'tr-ime-advanced-initialize "tr-ime" "\
Initialize tr-ime advanced (experimental but more functionality) features." nil nil)

(autoload 'tr-ime-uninitialize "tr-ime" "\
Uninitialize tr-ime features." nil nil)

(register-definition-prefixes "tr-ime" '("tr-ime-"))

;;;***

;;;### (autoloads nil "tr-ime-debug" "tr-ime-debug.el" (0 0 0 0))
;;; Generated autoloads from tr-ime-debug.el

(register-definition-prefixes "tr-ime-debug" '("tr-ime-debug-"))

;;;***

;;;### (autoloads nil "tr-ime-documentfeed" "tr-ime-documentfeed.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-documentfeed.el

(register-definition-prefixes "tr-ime-documentfeed" '("tr-ime-documentfeed-"))

;;;***

;;;### (autoloads nil "tr-ime-download" "tr-ime-download.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from tr-ime-download.el

(register-definition-prefixes "tr-ime-download" '("tr-ime-download-"))

;;;***

;;;### (autoloads nil "tr-ime-font" "tr-ime-font.el" (0 0 0 0))
;;; Generated autoloads from tr-ime-font.el

(register-definition-prefixes "tr-ime-font" '("tr-ime-font-"))

;;;***

;;;### (autoloads nil "tr-ime-hook" "tr-ime-hook.el" (0 0 0 0))
;;; Generated autoloads from tr-ime-hook.el

(register-definition-prefixes "tr-ime-hook" '("tr-ime-hook-"))

;;;***

;;;### (autoloads nil "tr-ime-isearch" "tr-ime-isearch.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from tr-ime-isearch.el

(register-definition-prefixes "tr-ime-isearch" '("tr-ime-isearch-"))

;;;***

;;;### (autoloads nil "tr-ime-openstatus" "tr-ime-openstatus.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-openstatus.el

(register-definition-prefixes "tr-ime-openstatus" '("tr-ime-openstatus-"))

;;;***

;;;### (autoloads nil "tr-ime-prefix-key" "tr-ime-prefix-key.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-prefix-key.el

(register-definition-prefixes "tr-ime-prefix-key" '("tr-ime-prefix-key-"))

;;;***

;;;### (autoloads nil "tr-ime-reconversion" "tr-ime-reconversion.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-reconversion.el

(register-definition-prefixes "tr-ime-reconversion" '("tr-ime-reconversion-"))

;;;***

;;;### (autoloads nil "tr-ime-recv-notify" "tr-ime-recv-notify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-recv-notify.el

(register-definition-prefixes "tr-ime-recv-notify" '("tr-ime-recv-notify-"))

;;;***

;;;### (autoloads nil "tr-ime-subclassify" "tr-ime-subclassify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-subclassify.el

(register-definition-prefixes "tr-ime-subclassify" '("tr-ime-subclassify-"))

;;;***

;;;### (autoloads nil "tr-ime-sync" "tr-ime-sync.el" (0 0 0 0))
;;; Generated autoloads from tr-ime-sync.el

(register-definition-prefixes "tr-ime-sync" '("tr-ime-sync-"))

;;;***

;;;### (autoloads nil "tr-ime-thread-message" "tr-ime-thread-message.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-thread-message.el

(register-definition-prefixes "tr-ime-thread-message" '("tr-ime-thread-message-"))

;;;***

;;;### (autoloads nil "tr-ime-workaround-inconsistent" "tr-ime-workaround-inconsistent.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-workaround-inconsistent.el

(register-definition-prefixes "tr-ime-workaround-inconsistent" '("tr-ime-workaround-inconsistent"))

;;;***

;;;### (autoloads nil "tr-ime-workaround-isearch" "tr-ime-workaround-isearch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-workaround-isearch.el

(register-definition-prefixes "tr-ime-workaround-isearch" '("tr-ime-workaround-isearch-"))

;;;***

;;;### (autoloads nil "tr-ime-workaround-prefix-key" "tr-ime-workaround-prefix-key.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from tr-ime-workaround-prefix-key.el

(register-definition-prefixes "tr-ime-workaround-prefix-key" '("tr-ime-workaround-prefix-key-"))

;;;***

;;;### (autoloads nil nil ("tr-ime-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; tr-ime-autoloads.el ends here
