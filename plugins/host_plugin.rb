require "sys/host"

class HostPlugin
  include WamekuPlugin::Common
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
