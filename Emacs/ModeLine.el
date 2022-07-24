;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      ModeLine.el                                                       ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2022, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

;;  改行文字の種類を表示するときの文字列
(setq   eol-mnemonic-dos        "[CRLF]")
(setq   eol-mnemonic-unix       "[LF]")
(setq   eol-mnemonic-mac        "[CR]")
(setq   eol-mnemonic-undecided  "[??]")

;;  文字エンコーディング判定
(defun  mymodeline-get-encoding-name (coding-system)
  (let* ((base (coding-system-base coding-system))
         (name (symbol-name base)))
    (cond ((string-prefix-p "utf-8" name) "U8")
          ((string-prefix-p "utf-16" name) "U16")
          ((string-prefix-p "japanese-shift-jis" name) "SJIS")
          (t "???")
          )))

;;  BOM 判定
(defun  mymodeline-get-bom-info (coding-system)
  (let ((name (symbol-name coding-system)))
    (cond ((string-match "be-with-signature" name) "BE")
          ((string-match "le-with-signature" name) "LE")
          ((string-match "-with-signature" name) "-BOM")
          (t "")
)))

(defun  mymodeline-display-buffer-coding-system ()
  (let* ((code buffer-file-coding-system)
         (name (mymodeline-get-encoding-name code))
         (bom  (mymodeline-get-bom-info code))
        )
    (format "%s%s" name bom)
))

(setq-default mode-line-misc-info
  '(:eval (mymodeline-display-buffer-coding-system))
)
