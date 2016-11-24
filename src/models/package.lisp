;;;; Define package for models

(in-package #:cl-user)

(defpackage #:dark-moon-blog.models
  (:documentation "Define models of database entities.")
  (:use #:cl
        #:cl-mongo
        #:dark-moon-blog.db
        #:dark-moon-blog.utils)
  ;; Article
  (:export #:article
           #:article-id
           #:article-name
           #:article-author
           #:article-status
           #:article-categories
           #:article-tags
           #:article-creation-date
           #:article-post-date
           #:article-data
           #:save-article
           #:find-articles-by
           #:remove-articles-by)
  ;; User
  (:export #:user
           #:user-name
           #:user-full-name
           #:user-password
           #:save-user
           #:find-users-by
           #:remove-users-by))
