;;;; Define a user model

(in-package #:dark-moon-blog.models)

;;; INTERFACE

(defclass user ()
  ((name :initarg :name
         :initform (error "Must supply a user name.")
         :accessor user-name
         :type string)
   (full-name :initarg :full-name
              :initform (error "Must supply a user full name.")
              :accessor user-full-name
              :type string)
   (password :initarg :password
             :initform (error "Must supply a user password.")
             :accessor user-password
             :type string))
  (:documentation "User model."))

(defun save-user (user)
  "Insert or update @cl:param(user) into database"
  (let ((doc (make-document)))
    (add-element "name" (user-name user) doc)
    (add-element "full_name" (user-full-name user) doc)
    (add-element "password" (cl-pass:hash (user-password user)) doc)
    (db.save *users-collection* doc :mongo *db-connection*)))

(defun find-users-by (&key)
  ()) ; TODO: implement!!!

(defun remove-users-by (&key)
  ()) ; TODO: implement!!!

;;; IMPLEMENTATION

(defmethod print-object ((object user) stream)
  (print-unreadable-object (object stream)
    (with-slots (name full-name password) object
      (let ((password-hash (cl-pass:hash password)))
        (format stream
                "Name: ~a~%Full name: ~a~%Password: ~a~%~
               Password hash: ~a"
                name full-name password password-hash)))))
