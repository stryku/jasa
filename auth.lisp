(in-package #:jasa.auth)

(defun test (&key
               ((:token token)))
  (jasa.core:send (format nil "auth.test?token=~A" token)))

(defun revoke (&key
                 ((:token token)))
  (jasa.core:send (format nil "auth.revoke?token=~A" token)))

