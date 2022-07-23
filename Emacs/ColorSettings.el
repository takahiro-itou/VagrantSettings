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

(defun mycs-setup-whitespaces ()
  (setq  whitespace-style  '(face  tabs))
  (set-face-foreground  'whitespace-tab  nil)
  (set-face-background  'whitespace-tab  "green")
  (global-whitespace-mode  1)
)

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
  (mycs-setup-whitespaces)
)

(defun mycs-setup-color-background-dark ()
  (mycs-setup-color-bgdark-enablebold)
  (set-face-foreground 'default "white")
  (set-face-background 'default "black")
  ; Show White Spaces.
  (mycs-setup-whitespaces)
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
