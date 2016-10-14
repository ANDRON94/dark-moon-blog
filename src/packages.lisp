;;;; Define packages

(in-package #:cl-user)

(defpackage #:dark-moon-blog
  (:documentation "Main dark-moon-blog code.FIXME.")
  (:use #:cl #:lucerne)
  (:export #:app))

(defpackage #:dark-moon-blog.app
  (:documentation "Setup application.")
  (:use #:cl)
  (:shadow #:restart)
  (:export #:start
           #:stop
           #:restart))
