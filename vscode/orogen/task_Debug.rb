#! /usr/bin/env ruby
#
require 'orocos'

include Orocos
Orocos.initialize

COMPONENT_NAME = '${COMPONENT_NAME}'
TASK_NAME = '${TASK_NAME}'
DEPLOYMENT_NAME = '${DEPLOYMENT_NAME}'

Orocos.run "#{COMPONENT_NAME}::#{TASK_NAME}" => "#{DEPLOYMENT_NAME}", :gdb => true do
    #Orocos.logger.level = Logger::DEBUG
    #Orocos.log_all
    io_port = "udp://127.0.0.1:8888"

    task = Orocos::TaskContext.get "#{DEPLOYMENT_NAME}"
    task.io_port = io_port
    task.io_read_timeout = Time.at(2);
    task.configure
    task.start
end

