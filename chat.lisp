(in-package #:jasa.chat)

(defun delete-message ()
  ())

(defun me-message ()
  ())

(defun post-message (&rest parameters &key
                                       ((:channel channel))
                                       ((:text text))
                                       ((:parse parse))
                                       ((:link_names link-names))
                                       ((:attachments attachments))
                                       ((:unfurl_links unfurl-links))
                                       ((:unfurl_media unfurl-media))
                                       ((:username username))
                                       ((:as_user as-user))
                                       ((:icon_url icon-url))
                                       ((:icon_emoji icon-emoji)))
  "Post message to a channel based on the given parameters."
  (jasa.core:send-and-get-answer
   (concatenate 'string
                "chat.postMessage?token="
                jasa:*token*
                (prepare-method parameters))))

(defun prepare-method (list)
  (concatenate-pairs (prepare-pairs list)))

(defun concatenate-pairs (list)
  (if list
      (concatenate 'string (car list) (concatenate-pairs (cdr list)))))

(defun prepare-pairs (list)
  (let ((parameters (remove-if-not #'symbolp list))
        (values (remove-if #'symbolp list)))
    (mapcar #'(lambda (parameter value) (format nil "&~A=~A" (string-downcase parameter) value)) parameters values)))

(defun update ()
  ())
