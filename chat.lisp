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
  (if (and (token channel text))
      (jasa.core:send
       (format nil "chat.postMessage?token=~A" token)
       :json (jasa.core:prepare-arguments (cddr parameters)
                                          #'(lambda (parameter value)
                                              (cons
                                               (string-downcase parameter)
                                               (string value)))))
      (error "Arguments :token :channel and :text are required.")))

(defun prepare-attachments (&rest attachments &key
                                                ((:fallback fallback))
                                                ((:fallback_id fallback-id))
                                                ((:attachment_type attachment-type))
                                                ((:actions actions)) ;; todo, json
                                                ((:color color))
                                                ((:pretext pretext))
                                                ((:author_name author-name))
                                                ((:author_link author-link))
                                                ((:author_icon author-icon))
                                                ((:title title))
                                                ((:title_link title-link))
                                                ((:text text))
                                                ((:fields fields)) ;; todo, json
                                                ((:image_url image-url))
                                                ((:thumb_url thumb-url))
                                                ((:footer footer))
                                                ((:footer_icon footer_icon))
                                                ((:ts ts)))
  "Returns attachments which can be used in  post-message function."
  (format nil "[~A]" (cl-json:encode-json-alist-to-string
                      (jasa.core:prepare-arguments attachments
                                         #'(lambda (parameter value)
                                             (cons
                                              (string-downcase parameter)
                                              value))))))

(defun delete-message ()
  ())

(defun me-message ()
  ())

(defun update ()
  ())
