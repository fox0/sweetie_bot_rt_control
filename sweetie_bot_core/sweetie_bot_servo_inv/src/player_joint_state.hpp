#ifndef OROCOS_SWEETIE_BOT_SERVO_INV_COMPONENT_HPP
#define OROCOS_SWEETIE_BOT_SERVO_INV_COMPONENT_HPP

#include <string>
#include <rtt/RTT.hpp>

#include <orocos/sensor_msgs/typekit/JointState.h>
#include <orocos/sweetie_bot_hardware_herkulex_msgs/typekit/ServoGoal.h>

class PlayerJointState : public RTT::TaskContext
{
	protected:
		// buffers
		unsigned int sample_index;
		unsigned int sample_dim;
		sensor_msgs::JointState joints;
		vector<double> trajectory_pos;
		vector<double> trajectory_vel;
		vector<double> trajectory_effort;

	// COMPONENT INTERFACE
	protected:
		// PORTS
		RTT::OutputPort<sensor_msgs::JointState> joints_port;

		// PROPERTIES
		std::string file_name;
		std::vector< std::string > joint_names;
		bool cycle;
		bool effort_presents;
		bool skip_first_column;
		
	public:
		PlayerJointState(std::string const& name);
		bool startHook();
		void updateHook();
		void stopHook();
};
#endif
