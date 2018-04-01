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

(defvar  mycs-settings-background-light  t)
(defvar  mycs-settings-face-enable-bold  t)

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

(load  "ColorSettings.el")

;;====================================================================;;
;;                                                                    ;;
;;    Key Bind Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(load  "KeyBind.el")

;;====================================================================;;
;;                                                                    ;;
;;    Japanese Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(load  "JapaneseSettings.el")

;;====================================================================;;
;;                                                                    ;;
;;    Window Settings.                                                ;;
;;    View   Settings.                                                ;;
;;                                                                    ;;
;;====================================================================;;

(load  "WindowSettings.el")

;;====================================================================;;
;;                                                                    ;;
;;    Programming Mode Settings.                                      ;;
;;    Debugger Settings.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(load  "Programming.el")
(load  "DebuggerSettings.el")
