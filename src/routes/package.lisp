;;;; Define package for routes

(in-package #:cl-user)

(defpackage #:dark-moon-blog.routes
  (:documentation "Define responds(views & api).")
  (:use #:cl #:lucerne)
  (:import-from #:dark-moon-blog #:app))
