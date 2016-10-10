(in-package #:jasa.auth)

(defun test ()
  (if jasa:*token*
      (jasa.core:send-and-get-answer (format nil "auth.test?token=~A" token))
      (error "Slack API token is not set. Make sure to set jasa:*token*.")))

(defun revoke ()
  (if jasa:*token*
      (jasa.core:send-and-get-answer (format nil "auth.revoke?token=~A" token))
      (error "Slack API token is not set. Make sure to set jasa:*token*.")))

