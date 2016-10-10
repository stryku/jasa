(in-package #:jasa.api)

(defun test (&key ((:error err)) ((:foo foo)))
  (jasa.core:send (prepare-method err foo)))

(defun prepare-method (err foo)
  (cond ((and err foo) (format nil "api.test?error=~A&foo=~A" err foo))
        (err (format nil "api.test?error=~A" err))
        (foo (format nil "api.test?foo=~A" foo))
        (t "api.test")))
