;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      DebuggerSettings.el                                               ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

(defun  mydbgs-define-gdb-key-vc6 ()
  (local-set-key  keyname-F2        'gud-display)
  (local-set-key  keyname-F3        'gud-print)
  (local-set-key  keyname-F5        'gud-cont)
  (local-set-key  keyname-S-F5      'gud-run)
  (local-set-key  keyname-C-F5      'gud-start)
  (local-set-key  keyname-F9        'gud-break)
  (local-set-key  keyname-S-F9      'gud-remove)
  (local-set-key  keyname-F10       'gud-next)
  (local-set-key  keyname-S-F10     'gud-finish)
  (local-set-key  keyname-F11       'gud-step)
)

(defun  mydbgs-define-gdb-key-vb6 ()
  (local-set-key  keyname-F2        'gud-display)
  (local-set-key  keyname-F3        'gud-print)
  (local-set-key  keyname-F5        'gud-cont)
  (local-set-key  keyname-S-F5      'gud-run)
  (local-set-key  keyname-C-F5      'gud-start)
  (local-set-key  keyname-F8        'gud-step)
  (local-set-key  keyname-S-F8      'gud-next)
  (local-set-key  keyname-C-S-F8    'gud-finish)
  (local-set-key  keyname-F9        'gud-break)
  (local-set-key  keyname-S-F9      'gud-remove)
)

(defun  mydbgs-define-gdb-key ()
  (mydbgs-define-gdb-key-vc6)
  )

(add-hook  'gdb-mode-hook  'mydbgs-define-gdb-key)
