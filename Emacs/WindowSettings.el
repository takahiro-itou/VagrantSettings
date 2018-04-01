;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      WindowSettings.el                                                 ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

;;====================================================================;;
;;                                                                    ;;
;;    Split Window When Start.                                        ;;
;;                                                                    ;;
;;====================================================================;;

(defun  myws-split-when-startup ()
  (let  (w  (selected-window))
    (split-window  w  80  t)))
(myws-split-when-startup)

