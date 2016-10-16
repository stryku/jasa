(in-package #:jasa.channels)

(defun history (&rest arguments &key
                                  ((:token token))
                                  ((:channel channel))
                                  ((:latest latest))
                                  ((:oldest oldest))
                                  ((:inclusive inclusive))
                                  ((:count count))
                                  ((:unreads unreads)))
  "Returns history of the channel."
  (if (and token channel)
      (jasa.core:send-and-get-answer
       (format nil "channels.history?token=~A&channel=~A"
               token
               (jasa.utils:build-url
                (jasa.core:prepare-arguments
                 (cddr arguments)
                 #'(lambda (parameter value)
                     (format nil "&~A=~A" (string-downcase parameter) value))))))
      (error "Both :token and :channel are required.")))

(defun info (&key
               ((:token token))
               ((:channel channel)))
  "Returns information about the channel."
  (if (and token channel)
      (jasa.core:send-and-get-answer (format nil "channels.info?token=~A&channel=~A" token channel))
      (error "Both :token and :channel are required.")))
