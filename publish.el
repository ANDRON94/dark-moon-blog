(let* ((common-article-properties
        '(
          :auto-sitemap t
          :base-extension "org"
          :html-doctype "html5"
          :html-postamble nil
          :html-preamble nil
          :publishing-function org-html-publish-to-html
          :recursive t
          :section-numbers nil
          :sitemap-filename "index.org"
          :sitemap-style list
          ))
       (org-publish-project-alist
        `(("en"
           :base-directory ,(expand-file-name "content/en/")
           :publishing-directory ,(expand-file-name "public-html/en/")
           ,@common-article-properties)
          ("uk"
           :base-directory ,(expand-file-name "content/uk/")
           :publishing-directory ,(expand-file-name "public-html/uk/")
           ,@common-article-properties)
          ("articles" :components ("en" "uk"))
          ("media"
           :base-directory ,(expand-file-name "content/")
           :base-extension "jpg\\|gif\\|png"
           :publishing-directory ,(expand-file-name "public-html/")
           :publishing-function org-publish-attachment
           :recursive t)
          ("dark-moon-blog" :components ("articles" "media")))))
  (org-publish "dark-moon-blog" t))

