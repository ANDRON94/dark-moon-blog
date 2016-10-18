;;;; Define route to main page

(in-package #:dark-moon-blog.routes)
(annot:enable-annot-syntax)

;;; *IMPLEMENTATION*

;;; Templates

(defparameter +index+ (djula:compile-template* "index.html"))

;;; Views

@route app "/"
(defview index ()
  (render-template (+index+)))
