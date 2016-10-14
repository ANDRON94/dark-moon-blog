(defsystem dark-moon-blog-test
  :author "Andrii Tymchuk <makedonsky94@gmail.com>"
  :license "MIT"
  :description "Tests for dark-moon-blog."
  :depends-on (:dark-moon-blog
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "dark-moon-blog")))))
