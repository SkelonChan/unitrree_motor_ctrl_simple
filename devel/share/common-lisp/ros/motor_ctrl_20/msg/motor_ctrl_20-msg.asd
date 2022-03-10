
(cl:in-package :asdf)

(defsystem "motor_ctrl_20-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "motor_rece" :depends-on ("_package_motor_rece"))
    (:file "_package_motor_rece" :depends-on ("_package"))
  ))