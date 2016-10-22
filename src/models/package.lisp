;;;; Define package for models

(in-package #:cl-user)

(defpackage #:dark-moon-blog.models
  (:documentation "Define models of database entities.")
  (:use #:cl #:dark-moon-blog.utils)
  ;; Article
  (:export #:article
           #:article-id
           #:article-name
           #:article-status
           #:article-categories
           #:article-tags
           #:article-creation-date
           #:article-post-date
           #:article-data))
