require "sys/host"
require_relative "plugin"

class HostPlugin
  include Plugin
  include Sys

  def initialize
  end

  def host_name
    Host.hostname
  end

  def host_ip_addr
    Host.ip_addr
  end

end
