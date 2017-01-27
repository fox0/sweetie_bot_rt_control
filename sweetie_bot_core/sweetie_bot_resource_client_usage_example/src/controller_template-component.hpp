#ifndef OROCOS_SWEETIE_BOT_RESOURCE_CLIENT_USAGE_EXAMPLE_COMPONENT_HPP
#define OROCOS_SWEETIE_BOT_RESOURCE_CLIENT_USAGE_EXAMPLE_COMPONENT_HPP

#include <vector>
#include <string>

#include <rtt/Component.hpp>

#include <sweetie_bot_logger/logger.hpp>
#include <sweetie_bot_resource_control/resource_client-service.hpp>

namespace sweetie_bot {
namespace motion {
namespace controller {


class ControllerTemplate : public RTT::TaskContext
{
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
		sweetie_bot::motion::ResourceClient * resource_client;

	protected:
		// COMPONENT STATE
		// ports buffers
		
#ifdef SWEETIEBOT_LOGGER
		SWEETIEBOT_LOGGER log;
#else
		sweetie_bot::LoggerRTT log;
#endif

	public:
		ControllerTemplate(std::string const& name);

		bool resourceChangedHook();

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
