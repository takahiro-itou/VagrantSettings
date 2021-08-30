
;;====================================================================;;
;;                                                                    ;;
;;    Install Packages.                                               ;;
;;                                                                    ;;
;;====================================================================;;

;;  package
(require  'package)
(add-to-list  'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;  use-package
;;  use-package が入っていなければインストールする
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install  'use-package))
