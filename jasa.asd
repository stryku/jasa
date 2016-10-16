(asdf:defsystem #:jasa
  :description "Just Another Slack API"
  :author "dptd <dptdescribe@gmail.com>"
  :license "MIT"
  :depends-on (#:dexador #:cl-json)
  :serial t
  :components ((:file "package")
               (:file "jasa")
               (:file "core")
               (:file "api")
               (:file "auth")
               (:file "chat")
               (:file "bots")
               (:file "im")
               (:file "emoji")
               (:file "channels")
               (:file "users")))
