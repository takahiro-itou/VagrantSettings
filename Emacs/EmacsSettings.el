;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      EmacsSettings.el                                                  ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

;;====================================================================;;
;;                                                                    ;;
;;    Default Settings.                                               ;;
;;                                                                    ;;
;;====================================================================;;

(defvar  myes-load-color-settings     t)
(defvar  myes-load-debugger-settings  t)
(defvar  myes-load-japanese-settings  t)
(defvar  myes-load-key-bind-settings  t)
(defvar  myes-load-programming        t)
(defvar  myes-load-window-settings    t)

(defvar  mycs-settings-background-light  t)
(defvar  mycs-settings-face-enable-bold  t)

;;====================================================================;;
;;                                                                    ;;
;;    Overwrite Default Values (For Local Settings).                  ;;
;;                                                                    ;;
;;====================================================================;;

(load  "~/LocalSettings/Emacs/EmacsLocal"  t)

;;====================================================================;;
;;                                                                    ;;
;;    Custom Variables.                                               ;;
;;                                                                    ;;
;;====================================================================;;

(custom-set-variables
  '(c-basic-offset  4)
  '(c-syntactic-indentation   t)
  '(c-tab-always-indent       nil)
  '(column-number-mode        t)
  '(fill-column               80)
  '(global-font-lock-mode t   nil  (font-lock))
  '(indent-tabs-mode          nil)
  '(line-number-mode          t)
  '(paren-mode                (quote  blink-paren)  nil  (paren))
  '(show-paren-mode           t nil (paren))
  '(show-trailing-whitespace  t)
  '(tab-width                 4)
  '(truncate-lines            nil)
  )

;;====================================================================;;
;;                                                                    ;;
;;    Face Color Sttings.                                             ;;
;;                                                                    ;;
;;====================================================================;;

(if (and  (boundp  'myes-load-color-settings)
          myes-load-color-settings)
    (load  "ColorSettings"))

;;====================================================================;;
;;                                                                    ;;
;;    Key Bind Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(if (and  (boundp  'myes-load-key-bind-settings)
          myes-load-key-bind-settings)
    (load  "KeyBind"))

;;====================================================================;;
;;                                                                    ;;
;;    Japanese Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(if (and  (boundp  'myes-load-japanese-settings)
          myes-load-japanese-settings)
    (load  "JapaneseSettings"))

;;====================================================================;;
;;                                                                    ;;
;;    Window Settings.                                                ;;
;;    View   Settings.                                                ;;
;;                                                                    ;;
;;====================================================================;;

(if (and  (boundp  'myes-load-window-settings)
          myes-load-window-settings)
    (load  "WindowSettings"))

;;====================================================================;;
;;                                                                    ;;
;;    Programming Mode Settings.                                      ;;
;;    Debugger Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(if (and  (boundp  'myes-load-programming)
          myes-load-programming)
    (load  "Programming"))

(if (and  (boundp  'myes-load-debugger-settings)
          myes-load-debugger-settings)
    (load  "DebuggerSettings"))
