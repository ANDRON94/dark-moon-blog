;;;; Blog setup and configuration

(in-package #:dark-moon-blog)
(annot:enable-annot-syntax)

;;; *IMPLEMENTATION*

;; Setup template directory
(djula:add-template-directory
 (asdf:system-relative-pathname :dark-moon-blog #p"templates/"))

;; Define http access logger
(defun http-access-logger (data)
  (with-open-file (stream
                   (asdf:system-relative-pathname :dark-moon-blog #p"access.log")
                   :direction :output
                   :if-exists :append
                   :if-does-not-exist :create)
    (format stream "~&~A~%" data)))

;;; *INTERFACE*

;; Setup configuration: middlewares, resource directories
(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (asdf:system-relative-pathname :dark-moon-blog #p"assets/")
                 :path "/static/")
                (clack.middleware.accesslog:<clack-middleware-accesslog>
                 :logger #'http-access-logger)))
