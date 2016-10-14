(defsystem dark-moon-blog
  :author "Andrii Tymchuk <makedonsky94@gmail.com>"
  :maintainer "Andrii Tymchuk <makedonsky94@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/ANDRON94/dark-moon-blog"
  :bug-tracker "https://github.com/ANDRON94/dark-moon-blog/issues"
  :source-control (:git "git@github.com:ANDRON94/dark-moon-blog.git")
  :depends-on (#:lucerne)
  :defsystem-depends-on (#:asdf-linguist)
  :components ((:module "assets"
                :components
                ((:module "css"
                  :components
                  ((:sass "style")))
                 (:module "js"
                  :components
                  ((:static-file "scripts.js")))))
               (:module "src"
                :serial nil
                :components
                ((:file "packages")
                 (:file "app" :depends-on ("packages"))
                 (:file "dark-moon-blog" :depends-on("packages")))))
  :description "Personal blog."
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op dark-moon-blog-test))))
