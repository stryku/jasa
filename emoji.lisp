(in-package #:jasa.emoji)

(defun list-emoji (&key
                     ((:token token)))
  "Returns list of custom emoji."
  (if token
      (jasa.core:send-and-get-answer (format nil "emoji.list?token=~A" token))
      (error "Argument :token is required.")))
