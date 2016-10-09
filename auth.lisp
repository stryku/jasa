(in-package #:jasa.auth)

(defun test ()
  (let ((token (jasa:get-token)))
  (if token
      (jasa.core:send-and-get-answer (format nil "auth.test?token=~A" token))
      (error "Slack API token is not set. You can set it by calling jasa:set-token."))))

(defun revoke ()
  (let ((token (jasa:get-token)))
    (if token
      (jasa.core:send-and-get-answer (format nil "auth.revoke?token=~A" token))
      (error "Slack API token is not set. You can set it by calling jasa:set-token."))))
