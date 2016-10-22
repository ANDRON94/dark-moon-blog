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

(defpackage #:dark-moon-blog.utils
  (:documentation "Collection of helpers")
  (:use #:cl)
  (:import-from #:local-time
                #:unix-to-timestamp
                #:format-timestring)
  (:export #:format-date
           #:beg-of-seq))
