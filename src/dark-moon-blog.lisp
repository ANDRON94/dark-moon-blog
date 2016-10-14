;;;; Blog setup and configuration

(in-package #:dark-moon-blog)
(annot:enable-annot-syntax)

;;; App

(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (asdf:system-relative-pathname :dark-moon-blog #p"assets/")
                 :path "/static/")))

;;; Templates

(djula:add-template-directory
 (asdf:system-relative-pathname :dark-moon-blog #p"templates/"))

(defparameter +index+ (djula:compile-template* "index.html"))

;;; Views

@route app "/"
(defview index ()
  (respond "<h1>Hello, world</h1>" :type "text/plain" :status 200))
;  (render-template (+index+)))
