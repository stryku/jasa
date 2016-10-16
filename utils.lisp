(in-package #:jasa.utils)

(defun channel-id (channel)
  "Returns channel ID."
  ())

(defun build-url (arguments)
  "Returns string created from list of cons."
  (if arguments
      (concatenate 'string (car arguments) (build-url (cdr arguments)))))
