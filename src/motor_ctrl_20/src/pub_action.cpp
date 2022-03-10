#include "ros/ros.h"
#include "motor_ctrl_20/motor_rece.h"
#include "unitree_motor_ctrl/motor_send.h"

unitree_motor_ctrl::motor_send msg;
int i =0;
class subandpub
{
private:
    ros::NodeHandle n;
    ros::Publisher pub;
    ros::Subscriber sub;
public:
    subandpub(){
        // pub1 = n1.advertise<unitree_motor_ctrl::motor_send>("/joint/motor1",100);
        pub = n.advertise<unitree_motor_ctrl::motor_send>("/joint/motor1",10);
        sub = n.subscribe<motor_ctrl_20::motor_rece>("motor_pos1",10,&subandpub::domsg2,this);
    }

        void domsg2(const motor_ctrl_20::motor_rece::ConstPtr &p1){
            if(abs(p1->motor1pos-msg.pos1*9.1) < 2 && abs(p1->motor2pos-msg.pos2*9.1) < 2){
                 msg.pos1 = -msg.pos1;
                 msg.pos2 = -msg.pos2;
            }
            pub.publish(msg);
            ROS_INFO("send is \n");
        }
};



int main(int argc, char * argv[])
{
    ros::init(argc, argv, "pub_action");
    
    msg.mode1 = 10;
    msg.tor1 = 0;
    msg.wrate1 = 0;
    msg.pos1 = 3.14;
    msg.kp1 = 0.005;
    msg.kw1 = 5;
    msg.mode2 = 10;
    msg.tor2 = 0;
    msg.wrate2 = 0;
    msg.pos2 = 3.14;
    msg.kp2 = 0.005;
    msg.kw2 = 5;
    
    // ros::NodeHandle n1;
    // ros::Publisher pub1 = n1.advertise<unitree_motor_ctrl::motor_send>("/joint/motor1",10);
    
    // ros::Duration(1.0).sleep();
    // // double t0 = ros::Time::now().toSec();
    // // while(ros::Time::now().toSec() < t0+1){
    // //     pub1.publish(msg);
    // // }
    
    
    // pub1.publish(msg);
    ROS_INFO("11111111111");
    subandpub tt;
    ROS_INFO("2222222222");
    ros::spin();
    ROS_INFO("3333333333");
    // ros::spin();
    // ros::AsyncSpinner spinner(2);
    // spinner.start();
    // ros::waitForShutdown();
    
    return 0;
}
