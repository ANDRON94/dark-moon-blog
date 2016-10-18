;;;; Define route to login page

(in-package #:dark-moon-blog.routes)
(annot:enable-annot-syntax)

;;; *IMPLEMENTATION*

;;; Templates

;(defparameter +login+ (djula:compile-template* "index.html")) ; TODO: implement login template.

;;; Views

@route app "/login"
(defview login ()
  (respond "Login page here... =)"))
                                        ;  (render-template (+index+)))
