;;;; Define packages

(in-package #:cl-user)

(defpackage #:dark-moon-blog
  (:documentation "Define app components.")
  (:use #:cl #:lucerne)
  (:export #:app))

(defpackage #:dark-moon-blog.app
  (:documentation "Startup configs.")
  (:use #:cl)
  (:shadow #:restart)
  (:export #:start
           #:stop
           #:restart))

(defpackage #:dark-moon-blog.db
  (:documentation "Setup connection to a database.")
  (:use #:cl #:cl-mongo)
  (:export #:*db-connection*
           #:*articles-collection*
           #:*users-collection*))

(defpackage #:dark-moon-blog.utils
  (:documentation "Collection of helpers")
  (:use #:cl)
  (:import-from #:local-time
                #:unix-to-timestamp
                #:format-timestring)
  (:export #:format-date
           #:beg-of-seq
           #:list->array
           #:array->list))
