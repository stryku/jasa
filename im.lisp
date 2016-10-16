(in-package #:jasa.im)

(defun close-im (&key
                   ((:token token))
                   ((:channel channel)))
  (jasa.core:send (format nil "im.close?token=~A&channel=~A" token channel)))

(defun list-im (&key
                  ((:token token)))
  (jasa.core:send-and-get-answer (format nil "im.list?token=~A" token)))

(defun mark (&key
               ((:token token))
               ((:channel channel))
               ((:ts ts)))
  (jasa.core:send (format nil "im.mark?token=~A&channel=~A&ts=~A" token channel ts)))

(defun open-im (&key
                  ((:token token))
                  ((:user user))
                  ((:return_im return-im)))
  (jasa.core:send-and-get-answer (format nil "im.open?token=~A&user=~A&return_im=~A" token user return-im)))

(defun history (&rest arguments &key
                                  ((:token token))
                                  ((:channel channel))
                                  ((:latest latest))
                                  ((:oldest olders))
                                  ((:inclusive inclusive))
                                  ((:count count))
                                  ((:unreads unreads)))
  (jasa.core:send-and-get-answer
   (format nil "im.history?token=~A&channel=~A"
           token
           (jasa.utils:build-url
            (jasa.core:prepare-arguments
             (cddr arguments)
             #'(lambda (parameter value)
                 (format nil "&~A=~A" (string-downcase parameter) value)))))))
