(in-package #:jasa.utils)

(defun channel-id (channel)
  "Returns channel ID from channel name."
  ())

(defun get-user-name-from-id (&key
                                ((:token token))
                                ((:user-id user-id)))
  "Returns username from user ID."
  (cdr (assoc :name (cdadr (jasa.users:info :token token :user user-id)))))

(defun build-url (arguments)
  "Returns string created from list of cons."
  (if arguments
      (concatenate 'string (car arguments) (build-url (cdr arguments)))))
