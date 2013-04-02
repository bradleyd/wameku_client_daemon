require "sys/cpu"

class CpuPlugin
  include WamekuPlugin::Common
  include Sys

  def initialize
  end

  def cpu_load
    CPU.load_avg
  end

  def stats
    CPU.cpu_stats
  end

end
