require "drb"
require 'active_support/all'
require "thread"
require "config"
require "utils"
begin
  require "wameku_plugin"
rescue Exception => e
  puts "Is wameku_plugin gem installed?"
  p e.message
  exit
end

# drb client that runs plugins from a plugin directory
module Wameku
  class Daemon
    attr_reader :config
    def initialize(opts={})
      @plugins = []
      @mutex   = Mutex.new
      @config  = opts.fetch(:config) { {"plugins"=>"~/.pulgins"} }
      load_plugins
    end

    def plugins
      @plugins.map {|i| i.class.to_s }
    end

    def load_plugins
      @plugins = []
      Dir[Wameku::Utils::AppHome.app_plugin_path + "/*.rb"].each {|file| 
        require file
        file_name = File.basename(file, '.rb')
        @plugins << file_name.camelcase.constantize.new unless file_name == "plugin"
      }
    end

    def run_me
      res = []
      @plugins.each do |plugin|
        res << plugin.run
      end
      res
    end
  end
end

if __FILE__ == $0
  #$SAFE = 1 # disable eval() and friends
  DRb.start_service("druby://127.0.0.1:1337", Wameku::Daemon.new)
  DRb.thread.join
end

