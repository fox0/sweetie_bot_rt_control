#ifndef OROCOS_SWEETIE_BOT_RESOURCE_CLIENT_USAGE_EXAMPLE_COMPONENT_HPP
#define OROCOS_SWEETIE_BOT_RESOURCE_CLIENT_USAGE_EXAMPLE_COMPONENT_HPP

#include <rtt/RTT.hpp>

#include <string>

#include <rtt_actionlib/rtt_actionlib.h>
#include <rtt_actionlib/rtt_action_server.h>
#include <actionlib/action_definition.h>

#include <sweetie_bot_resource_control_msgs/MoveManuallyAction.h>

#include <sweetie_bot_logger/logger.hpp>
#include <sweetie_bot_resource_control/resource_client-service.hpp>


namespace sweetie_bot {
namespace motion {
namespace controller {

class ControllerActionlibTemplate : public RTT::TaskContext
{
	protected:
		typedef actionlib::ServerGoalHandle<
            sweetie_bot_resource_control_msgs::MoveManuallyAction> GoalHandle;
		ACTION_DEFINITION(sweetie_bot_resource_control_msgs::MoveManuallyAction);	

	protected:
		// COMPONENT INTERFACE
		//
		// PORTS: input
		// PORTS: output
		// PROPERTIES
		std::vector<std::string> resources_required;
	protected:
		// OPERATIONS: provides
		// OPERATIONS: requires
		// SERVICES: 
		sweetie_bot::motion::ResourceClientInterface * resource_client;

	protected:
		// ACTIONLIB:
		rtt_actionlib::RTTActionServer<sweetie_bot_resource_control_msgs::MoveManuallyAction> action_server;
		GoalHandle goal;
        bool dataOnPortHook(RTT::base::PortInterface *portInterface); // enable actionlib port in stopped state

	protected:
		// COMPONENT STATE
		// ports buffers
		
#ifdef SWEETIEBOT_LOGGER
		SWEETIEBOT_LOGGER log;
#else
		LoggerRTT log;
#endif

	public:
		ControllerActionlibTemplate(std::string const& name);

		bool resourceChangedHook();

		void goalCallback(GoalHandle gh);
		void cancelCallback(GoalHandle gh);

		bool configureHook();
		bool startHook();
		void updateHook();
		void stopHook();
		void cleanupHook();
};

} // namespace controller
} // namespace motion
} // namespace sweetie_bot

#endif
