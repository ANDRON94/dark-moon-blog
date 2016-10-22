;;;; Define a article model

(in-package #:dark-moon-blog.models)

;;; INTERFACE

(defclass article ()
  ((id :initarg :id
       :initform -1
       :accessor article-id
       :type integer)
   (name :initarg :name
         :initform (error "Must supply an article name.")
         :accessor article-name
         :type string)
   (status :initarg :status
           :initform (error "Must supply an article status.") ; "Unpublished" "Published" "Hidden"
           :accessor article-status
           :type string)
   (categories :initarg :categories
               :initform (make-array 0 :fill-pointer 0 :adjustable t)
               :accessor article-categories
               :type vector)
   (tags :initarg :tags
         :initform (make-array 0 :fill-pointer 0 :adjustable  t)
         :accessor article-tags
         :type vector)
   (creation-date :initarg :creation-date
                  :initform (error "Must supply a creation date of article.")
                  :accessor article-creation-date
                  :type string)
   (post-date :initarg :post-date
                  :initform (error "Must supply a post date of article.")
                  :accessor article-post-date
                  :type string)
   (data :initarg :data
         :initform ""
         :accessor article-data
         :type string))
  (:documentation "Article model."))

;;; IMPLEMENTATION

(defmethod print-object ((object article) stream)
  (print-unreadable-object (object stream)
    (with-slots (id name status (c categories)
                    tags creation-date
                    post-date data) object
      (let ((cd (format-date creation-date))
            (pd (format-date post-date))
            (d (beg-of-seq data 50)))
        (format stream
                "Id: ~d~%Name: ~a~%Status: ~a~%Categories: ~a~%~
               Tags: ~a~%Creation date: ~a~%Post date: ~a~%~
               Data preview: \"~a\""
                id name status c tags cd pd d)))))
