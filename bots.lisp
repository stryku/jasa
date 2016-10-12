(in-package #:jasa.bots)

(defun info (&key
               ((:bot bot)))
  "Returns information about a bot user."
  (jasa.core:send (format nil "bots.info?token=~A&bot=~A" jasa:*token* bot)))
