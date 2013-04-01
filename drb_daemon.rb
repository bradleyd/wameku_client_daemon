require "drb"
require 'active_support/all'
require "thread"

class Wameku

  attr_accessor :plugins

  def initialize
    @plugins = []
    @mutex = Mutex.new
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
    load_plugins
    res = []
    res << {host: 'localhost'}
    @plugins.each do |plugin|
      res << plugin.run
      #puts Thread.current
      #puts "VAL: #{plugin}"
    end
    res
  end

end

#DRb.start_service("druby://127.0.0.1:1337", Wameku.new)
#DRb.thread.join
