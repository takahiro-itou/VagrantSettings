
;;========================================================================;;
;;                                                                        ;;
;;      JapaneseSettings.el                                               ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

(defun  myjs-setup-coding-utf8 ()
  (set-terminal-coding-system     'utf-8)
  (set-buffer-file-coding-system  'utf-8)
  (set-keyboard-coding-system     'utf-8)
  (set-selection-coding-system    'utf-8)
)

;(set-language-environment   "Japanese")
(myjs-setup-coding-utf8)
