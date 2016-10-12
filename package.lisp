(defpackage #:jasa
  (:use #:cl)
  (:export *token*))

(defpackage #:jasa.core
  (:use :cl)
  (:export send send-and-get-answer prepare-arguments))

(defpackage #:jasa.api
  (:use :cl)
  (:export test))

(defpackage #:jasa.auth
  (:use :cl)
  (:export revoke test))

(defpackage #:jasa.chat
  (:use :cl)
  (:export delete-message me-message post-message update prepare-attachments))

(defpackage #:jasa.bots
  (:use :cl)
  (:export info))

(defpackage #:jasa.im
  (:use :cl)
  (:export close-im history list-im mark open-im))
