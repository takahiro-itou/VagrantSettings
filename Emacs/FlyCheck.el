
;;====================================================================;;
;;                                                                    ;;
;;    FlyCheck.                                                       ;;
;;                                                                    ;;
;;====================================================================;;

;;  flycheck

;(load  "InstallPackages")
(use-package
    flycheck
    :ensure  t
    :config
    (global-flycheck-mode  t)
)

(defun  my-flycheck-setup ()
  flycheck-mode
  )

(add-hook  'c++-mode-hook   'my-flycheck-setup)
(add-hook  'c-mode-hook     'my-flycheck-setup)
