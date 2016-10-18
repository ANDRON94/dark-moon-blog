;;;; Blog setup and configuration

(in-package #:dark-moon-blog)
(annot:enable-annot-syntax)

;;; *INTERFACE*

;; Setup configuration: middlewares, resource directories
(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (asdf:system-relative-pathname :dark-moon-blog #p"assets/")
                 :path "/static/")))

;;; *IMPLEMENTATION*

;; Setup template directory
(djula:add-template-directory
 (asdf:system-relative-pathname :dark-moon-blog #p"templates/"))
