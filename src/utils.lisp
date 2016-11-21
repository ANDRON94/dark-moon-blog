;;;; Define different helpers

(in-package #:dark-moon-blog.utils)

;;; INTERFACE

(defun format-date (unix-string)
  "Format date that written as string in Unix time format"
  (let ((timestamp (unix-to-timestamp (parse-integer unix-string))))
    (format-timestring nil timestamp
                       :format '((:day 2) #\- :short-month #\- :year #\Space (:hour 2) #\: (:min 2)))))

(defun beg-of-seq (sequence count)
    "Get first @cl:param(count) elements from @cl:param(sequence)"
    (let* ((len (length sequence))
           (num (if (> len count) count len)))
      (subseq sequence 0 num)))

(defun list->array (list)
  "Convert @cl:param(list) to one-dimensional array"
  (make-array (length list) :initial-contents list))

(defun array->list (array)
  "Convert one-dimensional @cl:param(array) to list"
  (loop :for elem :across array :collect elem))
