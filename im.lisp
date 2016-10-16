(in-package #:jasa.im)

(defun close-im (&key
                   ((:token token))
                   ((:channel channel)))
  "Closes the direct message channel."
  (if (and token channel)
      (jasa.core:send (format nil "im.close?token=~A&channel=~A" token channel))
      (error "Arguments :token and :channel are required.")))

(defun list-im (&key
                  ((:token token)))
  "Returns a list of all IM channels that the bot has."
  (if token
      (jasa.core:send-and-get-answer (format nil "im.list?token=~A" token))
      (error "Argument :token is required.")))

(defun mark (&key
               ((:token token))
               ((:channel channel))
               ((:ts ts)))
  "Moves the read cursor in a direct message channel."
  (if (and token channel ts)
      (jasa.core:send (format nil "im.mark?token=~A&channel=~A&ts=~A" token channel ts))
      (error "Arguments :token :channel and :ts are required.")))

(defun open-im (&key
                  ((:token token))
                  ((:user user))
                  ((:return_im return-im)))
  "Opens a direct message channel."
  (if (and token user)
      (jasa.core:send-and-get-answer (format nil "im.open?token=~A&user=~A&return_im=~A" token user return-im))
      (error "Arguments :token and :user are required.")))

(defun history (&rest arguments &key
                                  ((:token token))
                                  ((:channel channel))
                                  ((:latest latest))
                                  ((:oldest olders))
                                  ((:inclusive inclusive))
                                  ((:count count))
                                  ((:unreads unreads)))
  "Returns a history of direct message channel."
  (if (and token channel)
      (jasa.core:send-and-get-answer
       (format nil "im.history?token=~A&channel=~A"
               token
               (jasa.utils:build-url
                (jasa.core:prepare-arguments
                 (cddr arguments)
                 #'(lambda (parameter value)
                     (format nil "&~A=~A" (string-downcase parameter) value))))))
      (error "Arguments :token and :channel are required.")))
