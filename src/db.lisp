;;;; Setup global database connection

(in-package #:dark-moon-blog.db)

;;; INTERFACE

(defvar *db-connection* (cl-mongo:mongo :db "darkmoon"
                                        :port cl-mongo:*mongo-default-port*
                                        :host cl-mongo:*mongo-default-host*))

(defparameter *articles-collection* "articles")

(defparameter *users-collection* "users")
