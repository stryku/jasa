(in-package #:jasa.channels)

(defun history (&key
                  ((:token token))
                  ((:channel channel))
                  ((:oldest oldest)))
  (jasa.core:send-and-get-answer (format nil "channels.history?token=~A&channel=~A&oldest=~A" token channel oldest)))

(defun info (&key
               ((:token token))
               ((:channel channel)))
  (jasa.core:send-and-get-answer (format nil "channels.info?token=~A&channel=~A" token channel)))
