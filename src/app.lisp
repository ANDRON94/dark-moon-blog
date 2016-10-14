;;;; Setup application

(in-package #:dark-moon-blog.app)

;;; INTERFACE

(defun start ()
  (load-source)
  ;; Start server
  (start-impl))

(defun stop ()
  ;; Stop server
  (stop-impl))

(defun restart ()
  (load-source)
  ;; Restart server
  (stop-impl)
  (start-impl))

;;; IMPLEMENTATION

(defun load-source ()
  ;; Load blog sources
  (ql:quickload "dark-moon-blog"))

(defun start-impl ()
  (lucerne:start dark-moon-blog:app :port 8000 :server :woo))

(defun stop-impl ()
  (lucerne:stop dark-moon-blog:app))
