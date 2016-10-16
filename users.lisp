(in-package #:jasa.users)

(defun info (&key
               ((:token token))
               ((:user user)))
  (if (and token user)
      (jasa.core:send-and-get-answer (format nil "users.info?token=~A&user=~A" token user))
      (error "Arguments :token and :user are required.")))
