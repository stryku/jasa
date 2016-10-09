(in-package #:jasa)

(defvar *token* nil)

(defun set-token (token)
  "Sets Slack API token."
  (setf *token* token))

(defun get-token ()
  "Returns Slack API token."
  *token*)
