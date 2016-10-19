(in-package #:jasa.utils)

(defun channel-id (&key
                     ((:token token))
                     ((:channel channel)))
  "Returns channel ID from channel name."
  (if (and token channel)
      (car (remove nil (mapcar
                        #'(lambda (x) (if
                                       (string=
                                        (cdr (assoc :name x))
                                        channel)
                                       (cdr (assoc :id x))))
                        (cdadr (jasa.channels:channels-list :token token)))))
      (error "Arguments :token and :channel are required.")))

(defun get-user-name-from-id (&key
                                ((:token token))
                                ((:user-id user-id)))
  "Returns username from user ID."
  (cdr (assoc :name (cdadr (jasa.users:info :token token :user user-id)))))

(defun build-url (arguments)
  "Returns string created from list of cons."
  (if arguments
      (concatenate 'string (car arguments) (build-url (cdr arguments)))))
