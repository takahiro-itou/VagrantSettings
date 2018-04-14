;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      CxxMode.el                                                        ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2014, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

;;====================================================================;;
;;                                                                    ;;
;;    Indentation of C/C++.                                           ;;
;;                                                                    ;;
;;====================================================================;;

(defvar  mycxx-indent-max-right-pos  36)

;;  インデント値の切り上げ。
;;  引数 val  を offs の倍数に切り上げる。
;;  その答えからさらに curcol を引く。
(defun  mycxx-ceiling-indent (val offs curcol)
  (- (* (/ (+ val offs -1) offs) offs) curcol)
)

;;  インデント値の切り捨て。
;;  引数 val  を offs の倍数に切り捨てる。
;;  但し、その答えが ofsmax を超えたら、
;;  インデント値として、ofsinover を採用する。
;;  それ以外は、切り捨て計算の結果から curcol を引く。
(defun  mycxx-floor-indent   (val offs curcol ofsmax ofsinover)
  (let* ( (pos (* (/ val offs) offs)) )
    (if (<= ofsmax pos)
        (min (- pos curcol) ofsinover)
      (- pos curcol)
      )
))

;;
;;
;;
(defun  mycxx-offs-calc-floor-indent (mbp curcol incr)
  (goto-char mbp)
  (mycxx-floor-indent (+ (current-column) (* c-basic-offset incr))
                      c-basic-offset
                      curcol
                      mycxx-indent-max-right-pos
                      (* c-basic-offset 2))
  )

;;
;;
;;
(defun  mycxx-ofsfn-arglist-intro (cs relpos curcol)
  (cond
   ((re-search-forward "=[ \\t]*[^ ]+(" (c-point 'eol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 2))
   (t (* c-basic-offset 2))
))

;;
;;
;;
(defun  mycxx-ofsfn-arglist-cont-nonempty (cs relpos curcol)
  (cond
   ((search-forward "if (" (c-point 'eol) t)
    (* c-basic-offset 2))
   (t (c-lineup-arglist cs))
))

;;
;;
;;
(defun  mycxx-ofsfn-defun-block-intro (cs relpos curcol)
  (cond
   ((re-search-forward "class " (c-point 'eol) t) 0)
   (t '+)
))

;;
;;
;;
(defun  mycxx-ofsfn-statement (cs relpos curcol)
  (cond
   ((search-backward "for (" (c-point 'bol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 2))
   (t 0)
))

;;
;;
;;
(defun  mycxx-ofsfn-statement-cont (cs relpos curcol)
  (cond
   ((re-search-forward "=[ \\t]*[^ ]+(" (c-point 'eol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 2))
   ((re-search-forward "const[ \\t]" (c-point 'eol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 1))
   ((re-search-forward "<.*>" (c-point 'eol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 1))
   ((search-backward "for (" (c-point 'bol) t)
    (mycxx-offs-calc-floor-indent (match-beginning 0) curcol 2))
   (t (* c-basic-offset 2))
))

;;
;;
;;
(defun  mycxx-ofsfn-stream-op (cs relpos curcol)
  (re-search-forward "<<\\|>>" (c-point 'eol) 'move)
  (goto-char (match-beginning 0))
  (- (current-column) curcol)
)

;;
;;
;;
(defun  mycxx-offset-setting (f langelem)
  (save-excursion
    (let* ( (relpos (cdr langelem))
            (curcol (progn (goto-char relpos) (current-column))) )
      (funcall f langelem relpos curcol)
)))

;;
;;
;;
(defun  mycxx-offs-arglist-intro (langelem)
  (mycxx-offset-setting  'mycxx-ofsfn-arglist-intro  langelem))

(defun  mycxx-offs-arglist-cont-nonempty (langelem)
  (mycxx-offset-setting  'mycxx-ofsfn-arglist-cont-nonempty  langelem))

(defun  mycxx-offs-statement (langelem)
  (mycxx-offset-setting  'mycxx-ofsfn-statement  langelem))

(defun  mycxx-offs-statement-cont (langelem)
  (mycxx-offset-setting  'mycxx-ofsfn-statement-cont  langelem))

(defun  mycxx-offs-stream-op (langelem)
  (mycxx-offset-setting  'mycxx-ofsfn-stream-op  langelem))

(defun  mycxx-setup-offset-settings ()
  (c-set-style   "stroustrup")
  (c-set-offset  'arglist-close          0)
  (c-set-offset  'arglist-cont-nonempty  'mycxx-offs-arglist-cont-nonempty)
  (c-set-offset  'arglist-intro          'mycxx-offs-arglist-intro)
  (c-set-offset  'c                      0)
  (c-set-offset  'cpp-macro-cont         '++)
  (c-set-offset  'inline-open            0)
  (c-set-offset  'innamespace            0)
  (c-set-offset  'statement              'mycxx-offs-statement)
  (c-set-offset  'statement-cont         'mycxx-offs-statement-cont)
  (c-set-offset  'stream-op              'mycxx-offs-stream-op)
)

;;====================================================================;;
;;                                                                    ;;
;;                                                                    ;;
;;====================================================================;;

(defun  mycxx-cplusplus-mode-setup ()
  (setq  tab-width  4)
  (mycxx-setup-offset-settings)
)

(add-hook  'c++-mode-hook   'mycxx-cplusplus-mode-setup)
(add-hook  'c-mode-hook     'mycxx-cplusplus-mode-setup)
(add-hook  'java-mode-hook  'mycxx-cplusplus-mode-setup)
