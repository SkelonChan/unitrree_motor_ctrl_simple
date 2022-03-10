; Auto-generated. Do not edit!


(cl:in-package motor_ctrl_20-msg)


;//! \htmlinclude motor_rece.msg.html

(cl:defclass <motor_rece> (roslisp-msg-protocol:ros-message)
  ((motor1pos
    :reader motor1pos
    :initarg :motor1pos
    :type cl:float
    :initform 0.0)
   (motor2pos
    :reader motor2pos
    :initarg :motor2pos
    :type cl:float
    :initform 0.0))
)

(cl:defclass motor_rece (<motor_rece>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_rece>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_rece)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name motor_ctrl_20-msg:<motor_rece> is deprecated: use motor_ctrl_20-msg:motor_rece instead.")))

(cl:ensure-generic-function 'motor1pos-val :lambda-list '(m))
(cl:defmethod motor1pos-val ((m <motor_rece>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_ctrl_20-msg:motor1pos-val is deprecated.  Use motor_ctrl_20-msg:motor1pos instead.")
  (motor1pos m))

(cl:ensure-generic-function 'motor2pos-val :lambda-list '(m))
(cl:defmethod motor2pos-val ((m <motor_rece>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader motor_ctrl_20-msg:motor2pos-val is deprecated.  Use motor_ctrl_20-msg:motor2pos instead.")
  (motor2pos m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_rece>) ostream)
  "Serializes a message object of type '<motor_rece>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor1pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'motor2pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_rece>) istream)
  "Deserializes a message object of type '<motor_rece>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor1pos) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'motor2pos) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_rece>)))
  "Returns string type for a message object of type '<motor_rece>"
  "motor_ctrl_20/motor_rece")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_rece)))
  "Returns string type for a message object of type 'motor_rece"
  "motor_ctrl_20/motor_rece")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_rece>)))
  "Returns md5sum for a message object of type '<motor_rece>"
  "6b93a1d04bd7942fecb98ba3b116d262")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_rece)))
  "Returns md5sum for a message object of type 'motor_rece"
  "6b93a1d04bd7942fecb98ba3b116d262")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_rece>)))
  "Returns full string definition for message of type '<motor_rece>"
  (cl:format cl:nil "float64 motor1pos~%float64 motor2pos~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_rece)))
  "Returns full string definition for message of type 'motor_rece"
  (cl:format cl:nil "float64 motor1pos~%float64 motor2pos~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_rece>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_rece>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_rece
    (cl:cons ':motor1pos (motor1pos msg))
    (cl:cons ':motor2pos (motor2pos msg))
))
