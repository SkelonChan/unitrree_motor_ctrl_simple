// Auto-generated. Do not edit!

// (in-package motor_ctrl_20.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motor_rece {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.motor1pos = null;
      this.motor2pos = null;
    }
    else {
      if (initObj.hasOwnProperty('motor1pos')) {
        this.motor1pos = initObj.motor1pos
      }
      else {
        this.motor1pos = 0.0;
      }
      if (initObj.hasOwnProperty('motor2pos')) {
        this.motor2pos = initObj.motor2pos
      }
      else {
        this.motor2pos = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motor_rece
    // Serialize message field [motor1pos]
    bufferOffset = _serializer.float64(obj.motor1pos, buffer, bufferOffset);
    // Serialize message field [motor2pos]
    bufferOffset = _serializer.float64(obj.motor2pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motor_rece
    let len;
    let data = new motor_rece(null);
    // Deserialize message field [motor1pos]
    data.motor1pos = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [motor2pos]
    data.motor2pos = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'motor_ctrl_20/motor_rece';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6b93a1d04bd7942fecb98ba3b116d262';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 motor1pos
    float64 motor2pos
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motor_rece(null);
    if (msg.motor1pos !== undefined) {
      resolved.motor1pos = msg.motor1pos;
    }
    else {
      resolved.motor1pos = 0.0
    }

    if (msg.motor2pos !== undefined) {
      resolved.motor2pos = msg.motor2pos;
    }
    else {
      resolved.motor2pos = 0.0
    }

    return resolved;
    }
};

module.exports = motor_rece;
