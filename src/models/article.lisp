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
   (author :initarg :author
         :initform (error "Must supply an article author.")
         :accessor article-author
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
              :initform creation-date
              :accessor article-post-date
              :type string)
   (data :initarg :data
         :initform ""
         :accessor article-data
         :type string))
  (:documentation "Article model."))

(defun save-article (article)
  "Insert or update @cl:param(article) into database"
  (let ((doc (make-document)))
    (add-element "id" (article-id article) doc)
    (add-element "name" (article-name article) doc)
    (add-element "author" (article-author article) doc)
    (add-element "status" (article-status article) doc)
    (add-element "categories" (array->list (article-categories article)) doc)
    (add-element "tags" (array->list (article-tags article)) doc)
    (add-element "creation_date" (article-creation-date article) doc)
    (add-element "post_date" (article-post-date article) doc)
    (add-element "data" (article-data article) doc)
    (db.save *articles-collection* doc :mongo *db-connection*)))

(defun find-articles-by (&key (id nil) (name nil) (author nil)
                           (status nil) (categories nil) (tags nil)
                           (creation-date nil) (post-date nil)
                           (limit 1) (skip 0))
  (let* ((query-res (db.find *articles-collection* ($ "status" status)
                            :limit limit
                            :skip skip
                            :mongo *db-connection*))
        (docs (second query-res)))
    (loop :with articles = (make-array (length docs)
                                       :fill-pointer 0)
       :for doc :in docs
       :do (vector-push (make-instance 'article
                                       :id (get-element "id" doc)
                                       :name (get-element "name" doc)
                                       :author "TestAuthor"
                                       ;; :author (get-element "author" doc)
                                       :status (get-element "status" doc)
                                       ;; :categories (get-element "categories" doc)
                                       ;; :tags (get-element "tags" doc)
                                       :creation-date (get-element "creation_date" doc)
                                       :post-date (get-element "post_date" doc)
                                       :data (get-element "data" doc))
                        articles)
       :finally (return articles))))

(defun remove-articles-by (&key)
  ()) ; TODO: implement!!!

;;;TEST

(defun get-article-by-id (id)
  (let ((doc (car (cadr (db.find *articles-collection* ($ "id" id)  :mongo *db-connection*)))))
    (make-instance 'article
                   :id (get-element "id" doc)
                   :name (get-element "name" doc)
                   :status (get-element "status" doc)
                   :creation-date "0000"
                   :post-date (get-element "post_date" doc))))

;;; IMPLEMENTATION

(defmethod print-object ((object article) stream)
  (print-unreadable-object (object stream)
    (with-slots (id name author status
                    (c categories) tags
                    creation-date post-date data) object
      (let ((cd (format-date creation-date))
            (pd (format-date post-date))
            (d (beg-of-seq data 50)))
        (format stream
                "Id: ~d~%Name: ~a~%Author: ~a~%Status: ~a~%Categories: ~a~%~
               Tags: ~a~%Creation date: ~a~%Post date: ~a~%~
               Data preview: \"~a\""
                id name author status c tags cd pd d)))))
