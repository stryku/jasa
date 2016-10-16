(defpackage #:jasa
  (:use #:cl))

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

(defpackage #:jasa.emoji
  (:use :cl)
  (:export list-emoji))

 (defpackage #:jasa.channels
   (:use :cl)
   (:export history info))

 (defpackage #:jasa.users
   (:use :cl)
   (:export info))

 (defpackage #:jasa.utils
   (:use :cl)
   (:export build-url channel-id))
