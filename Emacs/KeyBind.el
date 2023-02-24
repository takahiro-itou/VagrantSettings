;;  -*-  coding: utf-8; mode: emacs-lisp;  -*-  ;;
;;========================================================================;;
;;                                                                        ;;
;;      KeyBind.el                                                        ;;
;;                                                                        ;;
;;      Copyright (C) 2006-2022, Takahiro Itou.                           ;;
;;      All Rights Reserved.                                              ;;
;;                                                                        ;;
;;========================================================================;;

(cond
 ;; Emacs on Cygwin.
 ( (or (equal my-settings-editor "cygwin-emacs")
       (equal my-settings-editor "cygwin-xemacs")
   )
   (setq  keyname-End           [select])
   )
 ;; Other.
 ( t
   (setq  keyname-End           [End])
   )
)

;;  Common.
(setq  keyname-Home          [Home])
(setq  keyname-PageDown      [PageDown])
(setq  keyname-PageUp        [PageUp])
(setq  keyname-BackSpace     [BackSpace])
(setq  keyname-Delete        [Delete])

(setq  keyname-F1            [f1])
(setq  keyname-F2            [f2])
(setq  keyname-F3            [f3])
(setq  keyname-F4            [f4])
(setq  keyname-F5            [f5])
(setq  keyname-F6            [f6])
(setq  keyname-F7            [f7])
(setq  keyname-F8            [f8])
(setq  keyname-F9            [f9])
(setq  keyname-F10           [f10])
(setq  keyname-F11           [f11])
(setq  keyname-F12           [f12])

(setq  keyname-C-F1          [(control f1)] )
(setq  keyname-C-F2          [(control f2)] )
(setq  keyname-C-F3          [(control f3)] )
(setq  keyname-C-F4          [(control f4)] )
(setq  keyname-C-F5          [(control f5)] )
(setq  keyname-C-F6          [(control f6)] )
(setq  keyname-C-F7          [(control f7)] )
(setq  keyname-C-F8          [(control f8)] )
(setq  keyname-C-F9          [(control f9)] )
(setq  keyname-C-F10         [(control f10)])
(setq  keyname-C-F11         [(control f11)])
(setq  keyname-C-F12         [(control f12)])

(setq  keyname-S-F1          [(shift f1)] )
(setq  keyname-S-F2          [(shift f2)] )
(setq  keyname-S-F3          [(shift f3)] )
(setq  keyname-S-F4          [(shift f4)] )
(setq  keyname-S-F5          [(shift f5)] )
(setq  keyname-S-F6          [(shift f6)] )
(setq  keyname-S-F7          [(shift f7)] )
(setq  keyname-S-F8          [(shift f8)] )
(setq  keyname-S-F9          [(shift f9)] )
(setq  keyname-S-F10         [(shift f10)])
(setq  keyname-S-F11         [(shift f11)])
(setq  keyname-S-F12         [(shift f12)])

(setq  keyname-C-S-F1        [(control shift f1)] )
(setq  keyname-C-S-F2        [(control shift f2)] )
(setq  keyname-C-S-F3        [(control shift f3)] )
(setq  keyname-C-S-F4        [(control shift f4)] )
(setq  keyname-C-S-F5        [(control shift f5)] )
(setq  keyname-C-S-F6        [(control shift f6)] )
(setq  keyname-C-S-F7        [(control shift f7)] )
(setq  keyname-C-S-F8        [(control shift f8)] )
(setq  keyname-C-S-F9        [(control shift f9)] )
(setq  keyname-C-S-F10       [(control shift f10)])
(setq  keyname-C-S-F11       [(control shift f11)])
(setq  keyname-C-S-F12       [(control shift f12)])

;;====================================================================;;
;;                                                                    ;;
;;    Move Cursor Settings.                                           ;;
;;                                                                    ;;
;;====================================================================;;

(defun  up-one ()         (interactive)  (scroll-up    1) )
(defun  down-one ()       (interactive)  (scroll-down  1) )
(defun  up-slightly ()    (interactive)  (scroll-up    5) )
(defun  down-slightly ()  (interactive)  (scroll-down  5) )
(defun  up-a-lot ()       (interactive)  (scroll-up) )
(defun  down-a-lot ()     (interactive)  (scroll-down) )

(global-set-key  keyname-End         'move-end-of-line)
(global-set-key  keyname-Home        'move-beginning-of-line)

;; (global-set-key  keyname-PageDown    'up-a-lot)
;; (global-set-key  keyname-PageUp      'down-a-lot)

;; (global-set-key  [mouse-4]           'down-slightly)
;; (global-set-key  [mouse-5]           'up-slightly)

(global-set-key  "\M-g"  'goto-line)

;;====================================================================;;
;;                                                                    ;;
;;    Buffer Operations.                                              ;;
;;    Region Operations.                                              ;;
;;                                                                    ;;
;;====================================================================;;

(defun  mykb-kill-current-buffer-and-window ()
  (interactive)
  (kill-this-buffer)
  (delete-window)
)

(defun  mykb-set-buffer-file-coding-system ()
  (interactive)
  (set-buffer-file-coding-system 'utf-8-with-signature-unix)
)

(defun  mykb-unify-buffer-codings ()
  (interactive)
  (set-buffer-file-coding-system 'utf-8-with-signature-unix)
  (mark-whole-buffer)
  (delete-trailing-whitespace)
  ; (keyboard-quit)
)

(global-set-key  "\C-x\C-d"     'kill-this-buffer)
(global-set-key  "\C-xd"        'mykb-kill-current-buffer-and-window)
(global-set-key  keyname-F12    'set-mark-command)
(global-set-key  "\M-;"         'comment-region)
(global-set-key  "\C-x\M-;"     'uncomment-region)

(global-set-key  keyname-F2     'set-buffer-file-coding-system)
(global-set-key  keyname-S-F2   'mykb-set-buffer-file-coding-system)
(global-set-key  keyname-C-F2   'mykb-unify-buffer-codings)
