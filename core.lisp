(in-package #:jasa.core)

(defvar *slack-url* "https://slack.com/api/")

(defun send (method json)
  "Sends HTTP request to Slack."
  (dex:post (format nil "~A~A" *slack-url* method) :content json))
