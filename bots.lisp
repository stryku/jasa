(in-package #:jasa.bots)

(defun info (&key
               ((:token token))
               ((:bot bot)))
  "Returns information about a bot user."
  (if token
      (jasa.core:send-and-get-answer (format nil "bots.info?token=~A&bot=~A" token bot))
      (error "Argument :token is required.")))
