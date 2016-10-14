(in-package :cl-user)
(defpackage dark-moon-blog-test
  (:use :cl :fiveam))
(in-package :dark-moon-blog-test)

(def-suite tests
  :description "dark-moon-blog tests.")
(in-suite tests)

(test simple-test
  (is
   (equal 1 1))
  (is-true
   (and t t)))

(run! 'tests)
