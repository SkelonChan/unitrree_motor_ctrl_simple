#include "serialPort/SerialPort.h"
#include "unitree_motor_ctrl/motor_send.h"
#include "motor_ctrl_20/motor_rece.h"
#include <csignal>
#include "ros/ros.h"

MOTOR_send motor_run1, motor_run2,motor_stop1,motor_stop2;
    // receive message struct
MOTOR_recv motor_r1,motor_r2;
motor_ctrl_20::motor_rece motor_rece;



class pubandsub1
{
private:
    ros::NodeHandle nh;
    ros::Publisher pub;
    ros::Subscriber sub;
public:
    pubandsub1(){
    pub = nh.advertise<motor_ctrl_20::motor_rece>("motor_pos1",10);
    sub = nh.subscribe<unitree_motor_ctrl::motor_send>("/joint/motor1",10,&pubandsub1::domsg,this);
    }

    void domsg(const unitree_motor_ctrl::motor_send::ConstPtr &p){
    motor_run1.id = 0;
    motor_run1.motorType = MotorType::A1Go1;
    motor_run1.mode = p->mode1;
    motor_run1.T = p->tor1;
    motor_run1.W = p->wrate1;
    motor_run1.Pos = p->pos1*9.1;
    motor_run1.K_P = p->kp1;
    motor_run1.K_W = p->kw1;

    motor_run2.id = 2;
    motor_run2.motorType = MotorType::A1Go1;
    motor_run2.mode = p->mode2;
    motor_run2.T = p->tor2;
    motor_run2.W = p->wrate2;
    motor_run2.Pos = p->pos2*9.1;
    motor_run2.K_P = p->kp2;
    motor_run2.K_W = p->kw2;

    motor_r1.motorType = motor_run1.motorType;
    motor_r2.motorType = motor_run2.motorType;

    modify_data(&motor_run1);
    modify_data(&motor_run2);
    modify_data(&motor_stop1);
    modify_data(&motor_stop2);

    SerialPort serial("/dev/ttyUSB0");


    serial.sendRecv(&motor_run1, &motor_r1);
    usleep(1000);
    serial.sendRecv(&motor_run2, &motor_r2);
    printf("POS1 is : %f\n",motor_r1.Pos);
    printf("POS2 is : %f\n",motor_r2.Pos);
    motor_rece.motor1pos = motor_r1.Pos;
    motor_rece.motor2pos = motor_r2.Pos;
    pub.publish(motor_rece);

    }
    
};


int main(int argc, char *argv[])
{

    ros::init(argc, argv, "motor_ctr");
    ros::NodeHandle nh;

    pubandsub1 tt1;
    ROS_INFO("4444444");
    ros::spin();
    return 0;
}




