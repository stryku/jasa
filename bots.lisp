(in-package #:jasa.bots)

(defun info (&key
               ((:token token))
               ((:bot bot)))
  "Returns information about a bot user."
  (jasa.core:send (format nil "bots.info?token=~A&bot=~A" token bot)))
