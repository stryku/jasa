(in-package #:jasa.users)

(defun info (&key
               ((:token token))
               ((:user user)))
  (jasa.core:send-and-get-answer (format nil "users.info?token=~A&user=~A" token user)))
