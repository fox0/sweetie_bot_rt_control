-- LOGGER DEPLOYMENT MODULE
--
-- Simplify logger initialization.
require 'rttlib'

-- get Deployer
local depl = rtt.getTC():getPeer("Deployer")

-- import ros facilities
depl:import("rtt_ros") 
local ros = rtt.provides("ros")

-- import logger
ros:import("sweetie_bot_logger")

-- Module table
logger = {}

-- Fast access to log4cpp Service
depl:loadService("Deployer", "log4cpp")
logger.log4cpp = depl:provides("log4cpp")

-- Init categories log levels using ocl::logging::LoggerService component.
-- Set log levels and additivity using corresponding properties in .cpf file.
function logger.init_loglevels_cpf(cpf_file)
	name = "log_ocl";
	depl:loadComponent(name, "OCL::logging::LoggingService")
	depl:setActivity(name, 0.5, 0, 0)
	depl:loadService(name,"marshalling")
    logger.service = depl:getPeer(name)
	logger.service:provides("marshalling"):loadProperties(cpf_file)
	return logger.service:configure()
end

-- Init categories log levels using log4cpp configureation file.
-- Full log4cpp configuration infrastructure can be deployed.
function logger.init_loglevels_log4cpp(log4cpp_file)
	return depl:provides("log4cpp"):configure(log4cpp_file)
end

-- Redirect RTT log to \rosout
function logger.redirect_rttlog_to_rosout()
	depl:loadService("Deployer", "log4cpp")
	-- output Category for RTT::Logger, buffer for 20 messages
	logger.log4cpp:addRosAppender("org.orocos.rtt", 20); 
end

