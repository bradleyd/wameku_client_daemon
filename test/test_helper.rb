require 'test/unit'
require "mocha/setup"
require "wameku_plugin"
require File.dirname(__FILE__) + '/../lib/wameku'

SUPPORT_PATH = File.dirname(__FILE__) + "/support"
TEST_PID = File.join(SUPPORT_PATH, "test.pid")

