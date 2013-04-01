require "sys/cpu"
require_relative "plugin"

class CpuPlugin
  include Plugin
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
