(in-package #:jasa.core)

(defvar *slack-url* "https://slack.com/api/")

(defun send (method)
  "Sends HTTP request to specific Slack method."
  (dex:post (format nil "~A~A" *slack-url* method)))

(defun send-and-get-answer (method)
  "Sends HTTP request to specific Slack public method."
  (cl-json:decode-json-from-string (dex:get (format nil "~A~A" *slack-url* method))))
