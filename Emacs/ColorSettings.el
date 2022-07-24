;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      ColorSettings.el                                                  ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2022, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

(require  'cl)
(require  'whitespace)

;;====================================================================;;
;;                                                                    ;;
;;    Default Settings.                                               ;;
;;                                                                    ;;
;;====================================================================;;

(defvar  mycs-display-flag-newline  t)
(defvar  mycs-eol-crlf              nil)

;;====================================================================;;
;;                                                                    ;;
;;    Back Ground is Light Color.                                     ;;
;;    Bold is Enabled.                                                ;;
;;                                                                    ;;
;;====================================================================;;

(defun  mycs-setup-color-bglight-enablebold ()
  (custom-set-faces
   '(default ((t (:size "12pt" :family "Lucidatypewriter"))) t)
   '(font-lock-string-face
     ((((class color) (background light)) (:foreground "green4"))))
   '(font-lock-variable-name-face
     ((((class color) (background light)) (:foreground "magenta"))))
   '(font-lock-keyword-face
     ((((class color) (background light)) (:foreground "blue" :bold t))))
   '(font-lock-comment-face
     ((((class color) (background light)) (:foreground "red3"))))
   '(font-lock-comment-delimiter-face
     ((((class color) (background light)) (:foreground "red3"))))
   '(font-lock-function-name-face
     ((((class color) (background light)) (:foreground "purple" :bold t))))
   ;; '(font-lock-type-face
   ;;   ((((class color) (background light)) (:foreground "steelblue3"))))
   '(font-lock-type-face
     ((((class color) (background light)) (:foreground "orange4"))))
   '(text-cursor ((t (:foreground "white" :background "red3"))) t)
   )
)

;;====================================================================;;
;;                                                                    ;;
;;    Back Ground is Light Color.                                     ;;
;;    Bold is Disabled.                                               ;;
;;                                                                    ;;
;;====================================================================;;

(defun  mycs-setup-color-bglight-disablebold ()
  (custom-set-faces
   '(font-lock-string-face
     ((((class color) (background light)) (:foreground "red"))))
   '(font-lock-variable-name-face
     ((((class color) (background light)) (:foreground "magenta"))))
   '(font-lock-keyword-face
     ((((class color) (background light)) (:foreground "blue"))))
   '(font-lock-comment-face
     ((((class color) (background light)) (:foreground "red"))))
   '(font-lock-function-name-face
     ((((class color) (background light)) (:foreground "purple"))))
   '(font-lock-type-face
     ((((class color) (background light)) (:foreground "steelblue3"))))
   '(text-cursor ((t (:foreground "white" :background "red3"))) t)
   )
)

;;====================================================================;;
;;                                                                    ;;
;;    Back Ground is Dark Color.                                      ;;
;;    Bold is Enabled.                                                ;;
;;                                                                    ;;
;;====================================================================;;

(defun  mycs-setup-color-bgdark-enablebold ()
  (custom-set-faces
   '(font-lock-string-face
     ((((class color) (background light)) (:foreground "red"))))
   '(font-lock-variable-name-face
     ((((class color) (background light)) (:foreground "magenta"))))
   '(font-lock-keyword-face
     ((((class color) (background light)) (:foreground "blue" :bold t))))
   '(font-lock-comment-face
     ((((class color) (background dark)) (:foreground "red"))))
   '(font-lock-function-name-face
     ((((class color) (background light)) (:foreground "purple" :bold t))))
   '(text-cursor ((t (:foreground "white" :background "Red3"))) t)
   )
)

;;====================================================================;;
;;                                                                    ;;
;;    White Space Settings                                            ;;
;;                                                                    ;;
;;====================================================================;;

(defun mycs-whitespace-display-mappings (eol-crlf)
  (cond
   ( (eq eol-crlf 0)
     '(
       (space-mark   ?\u3000 [?\u25a1])
       (newline-mark ?\n     [?\u2193 ?\n])
      ) )
   ( (eq eol-crlf 1)
    '(
      (space-mark   ?\u3000 [?\u25a1])
      (newline-mark ?\n     [?\u21B5 ?\n])
     ) )
   ( (eq eol-crlf 2)
    '(
      (space-mark   ?\u3000 [?\u25a1])
      (newline-mark ?\n     [?\u2190 ?\n])
     ) )
   ( t
    '(
      (space-mark   ?\u3000 [?\u25a1])
      (newline-mark ?\n     [?\n])
     ) )
))

(defun mycs-enable-displaying-newline ()
  (let* ((code buffer-file-coding-system)
         (eol (coding-system-eol-type code))
     )
    ; (message "code:%s EOL:%s CRLF:%s" code eol eol-crlf)
    (setq whitespace-display-mappings
      (mycs-whitespace-display-mappings eol))
    (whitespace-display-char-on)
))

(defun mycs-toggle-display-newline ()
  (setq  mycs-display-flag-newline  (not mycs-display-flag-newline))
  (mycs-enable-displaying-newline)
)

(defun mycs-setup-whitespaces (eol-crlf)
  (setq  whitespace-style
    '(face tabs spaces space-mark newline newline-mark)
    )
  (set-face-foreground  'whitespace-newline     "purple")
  (set-face-background  'whitespace-newline     nil)
  (set-face-foreground  'whitespace-space       "purple")
  (set-face-background  'whitespace-space       nil)
  (set-face-foreground  'whitespace-tab         nil)
  (set-face-background  'whitespace-tab         "green")
  (mycs-enable-displaying-newline)
  (setq whitespace-space-regexp "\\([\u0020\u3000\u000d\r]+\\)")
  (global-whitespace-mode  1)
)

(add-hook  'find-file-hooks  'mycs-enable-displaying-newline)

;;====================================================================;;
;;                                                                    ;;
;;    Face Color Settings.                                            ;;
;;                                                                    ;;
;;====================================================================;;

(defun mycs-setup-color-background-light ()
  (if mycs-settings-face-enable-bold
      (mycs-setup-color-bglight-enablebold)
      (mycs-setup-color-bglight-disablebold))
  (set-face-foreground 'default "#000000")
  (set-face-background 'default "#FFFFFF")
  ; Show White Spaces.
  (mycs-setup-whitespaces mycs-eol-crlf)
)

(defun mycs-setup-color-background-dark ()
  (mycs-setup-color-bgdark-enablebold)
  (set-face-foreground 'default "white")
  (set-face-background 'default "black")
  ; Show White Spaces.
  (mycs-setup-whitespaces mycs-eol-crlf)
)

;;====================================================================;;
;;                                                                    ;;
;;    Select Face Color Settings.                                     ;;
;;                                                                    ;;
;;====================================================================;;

(if  mycs-settings-background-light
    (mycs-setup-color-background-light)
    (mycs-setup-color-background-dark)
)
