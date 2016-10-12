(in-package #:jasa.im)

(defun close-im (&key
                ((:channel channel)))
  (jasa.core:send (format nil "im.close?token=~A&channel=~A" jasa:*token* channel)))

(defun list-im ()
  (jasa.core:send-and-get-answer (format nil "im.list?token=~A" jasa:*token*)))

(defun mark (&key
               ((:channel channel))
               ((:ts ts)))
  (jasa.core:send (format nil "im.mark?token=~A&channel=~A&ts=~A" jasa:*token* channel ts)))

(defun open-im (&key
               ((:user user))
               ((:return_im return-im)))
  (jasa.core:send-and-get-answer (format nil "im.open?token=~A&user=~A&return_im=~A" jasa:*token* user return-im)))

(defun history (&rest arguments &key
                                  ((:channel channel))
                                  ((:latest latest))
                                  ((:oldest olders))
                                  ((:inclusive inclusive))
                                  ((:count count))
                                  ((:unreads unreads)))
  (jasa.core:send-and-get-answer
   (format nil "im.history?token=~A&channel=~A"
           jasa:*token*
           (build-url
            (jasa.core:prepare-arguments
             arguments
             #'(lambda (parameter value)
                 (format nil "&~A=~A" (string-downcase parameter) value)))))))

(defun build-url (arguments)
  (if arguments
      (concatenate 'string (car arguments) (build-url (cdr arguments)))))

