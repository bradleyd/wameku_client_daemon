require "drb"
require 'active_support/all'
require "thread"

# drb client that runs plugins from a plugin directory
class Wameku

  def initialize
    @plugins = []
    @mutex = Mutex.new
    load_plugins
  end

  def plugins
    @plugins.map {|i| i.class.to_s }
  end

  def load_plugins
    @mutex.synchronize do
      @plugins = []
      Dir[File.dirname(__FILE__) + '/plugins/*.rb'].each {|file| 
        require file
        file_name = File.basename(file, '.rb')
        @plugins << file_name.camelcase.constantize.new unless file_name == "plugin"
    }
    end
  end

  def run_me
    res = []
    #res << {host: 'localhost'}
    @plugins.each do |plugin|
      res << plugin.run
      #puts Thread.current
      #puts "VAL: #{plugin}"
    end
    res
  end

end

DRb.start_service("druby://127.0.0.1:1337", Wameku.new)
DRb.thread.join
