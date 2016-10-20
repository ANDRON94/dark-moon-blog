;;;; Define package for models

(in-package #:cl-user)

(defpackage #:dark-moon-blog.models
  (:documentation "Define models of database entities.")
  (:use #:cl)
  ;; Article
  (:export #:article))
           ; TODO: export accessors))

