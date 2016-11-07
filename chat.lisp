(in-package #:jasa.chat)

(defun post-message (&rest parameters &key
                                        ((:token token))
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
  (if (and token channel)
      (jasa.core:send
       (format nil "chat.postMessage?token=~A" token)
       :json (jasa.core:prepare-arguments (cddr parameters)
                                          #'(lambda (parameter value)
                                              (cons
                                               (string-downcase parameter)
                                               (string value)))))
      (error "Arguments :token and :channel are required.")))

(defun prepare-attachments (&rest attachments &key
                                                ((:fallback fallback))
                                                ((:fallback_id fallback-id))
                                                ((:attachment_type attachment-type))
                                                ;((:actions actions)) ;; todo, json
                                                ((:color color))
                                                ((:pretext pretext))
                                                ((:author_name author-name))
                                                ((:author_link author-link))
                                                ((:author_icon author-icon))
                                                ((:title title))
                                                ((:title_link title-link))
                                                ((:text text))
                                                ;((:fields fields)) ;; todo, json
                                                ((:mrkdwn_in mrkdwn-in)) ;; todo, json
                                                ((:image_url image-url))
                                                ((:thumb_url thumb-url))
                                                ((:footer footer))
                                                ((:footer_icon footer_icon))
                                                ((:ts ts)))
  "Returns attachments which can be used in post-message function."
  (format nil "[{~A}]" (prepare-json-from-attachments attachments)))

(defun prepare-json-from-attachments (attachments)
  (if attachments
      (if (eq (car attachments) :mrkdwn_in)
          (concatenate 'string (format nil "\"mrkdwn_in\":[\"~A\"]" (cadr attachments)))
          (concatenate 'string (format nil "\"~A\":\"~A\"," (string-downcase (car attachments)) (cadr attachments)) (foo (cddr attachments))))))

(defun delete-message (&rest arguments &key
                                          ((:token token))
                                          ((:ts ts))
                                          ((:channel channel))
                                          ((:as_user as-user)))
  "Deletes a message from the channel."
  (if (and token ts channel)
      (jasa.core:send (format nil "chat.delete?token=~A~A" token
                              (jasa.utils:build-url
                               (jasa.core:prepare-arguments (cddr arguments) #'(lambda (parameter value)
                                                                                 (format nil "&~A=~A" (string-downcase parameter) value))))))
      (error "Arguments :token :ts and :channel are required.")))

(defun me-message ()
  ())

(defun update ()
  ())
