
;;========================================================================;;
;;                                                                        ;;
;;      KeyBind.el                                                        ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

(cond
 ;;	Emacs on Cygwin.
 ( (or (equal my-settings-editor "cygwin-emacs")
       (equal my-settings-editor "cygwin-xemacs")
   )
   (setq  keyname-End           [select])
   (setq  keyname-Home          [Home])
   (setq  keyname-PageDown      [PageDown])
   (setq  keyname-PageUp        [PageUp])
   (setq  keyname-BackSpace     [BackSpace])
   (setq  keyname-Delete        [Delete])
   )
 ;;	Other.
 ( t
   (setq  keyname-End           [End])
   (setq  keyname-Home          [Home])
   (setq  keyname-PageDown      [PageDown])
   (setq  keyname-PageUp        [PageUp])
   (setq  keyname-BackSpace     [BackSpace])
   (setq  keyname-Delete        [Delete])
   )
)

;;====================================================================;;
;;                                                                    ;;
;;    Move Cursor Settings.                                           ;;
;;                                                                    ;;
;;====================================================================;;

(global-set-key  keyname-End         'move-end-of-line)
(global-set-key  keyname-Home        'move-beginning-of-line)
(global-set-key  keyname-PageDown    'up-a-log)
(global-set-key  keyname-PageUp      'down-a-lot)
