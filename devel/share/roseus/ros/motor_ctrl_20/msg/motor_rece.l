;; Auto-generated. Do not edit!


(when (boundp 'motor_ctrl_20::motor_rece)
  (if (not (find-package "MOTOR_CTRL_20"))
    (make-package "MOTOR_CTRL_20"))
  (shadow 'motor_rece (find-package "MOTOR_CTRL_20")))
(unless (find-package "MOTOR_CTRL_20::MOTOR_RECE")
  (make-package "MOTOR_CTRL_20::MOTOR_RECE"))

(in-package "ROS")
;;//! \htmlinclude motor_rece.msg.html


(defclass motor_ctrl_20::motor_rece
  :super ros::object
  :slots (_motor1pos _motor2pos ))

(defmethod motor_ctrl_20::motor_rece
  (:init
   (&key
    ((:motor1pos __motor1pos) 0.0)
    ((:motor2pos __motor2pos) 0.0)
    )
   (send-super :init)
   (setq _motor1pos (float __motor1pos))
   (setq _motor2pos (float __motor2pos))
   self)
  (:motor1pos
   (&optional __motor1pos)
   (if __motor1pos (setq _motor1pos __motor1pos)) _motor1pos)
  (:motor2pos
   (&optional __motor2pos)
   (if __motor2pos (setq _motor2pos __motor2pos)) _motor2pos)
  (:serialization-length
   ()
   (+
    ;; float64 _motor1pos
    8
    ;; float64 _motor2pos
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _motor1pos
       (sys::poke _motor1pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _motor2pos
       (sys::poke _motor2pos (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _motor1pos
     (setq _motor1pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _motor2pos
     (setq _motor2pos (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get motor_ctrl_20::motor_rece :md5sum-) "6b93a1d04bd7942fecb98ba3b116d262")
(setf (get motor_ctrl_20::motor_rece :datatype-) "motor_ctrl_20/motor_rece")
(setf (get motor_ctrl_20::motor_rece :definition-)
      "float64 motor1pos
float64 motor2pos
")



(provide :motor_ctrl_20/motor_rece "6b93a1d04bd7942fecb98ba3b116d262")


