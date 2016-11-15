(in-package #:jasa.groups)

(defun history (&rest arguments &key
                                  ((:token token))
                                  ((:channel channel))
                                  ((:latest latest))
                                  ((:oldest oldest))
                                  ((:inclusive inclusive))
                                  ((:count count))
                                  ((:unreads unreads)))
  "Returns history of the group."
  (if (and token channel)
      (jasa.core:send-and-get-answer
       (format nil "groups.history?token=~A&channel=~A"
               token
               (jasa.utils:build-url
                (jasa.core:prepare-arguments
                 (cddr arguments)
                 #'(lambda (parameter value)
                     (format nil "&~A=~A" (string-downcase parameter) value))))))
      (error "Both :token and :channel are required.")))
