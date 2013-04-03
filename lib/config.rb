require "yaml"
module Wameku
  class Config
    def self.load(config_path=nil)
      begin
        YAML.load_file(File.join(Utils::AppHome.app_config_path, "wameku.yml"))
      rescue Errno::ENOENT => e
        {"plugins" =>  "plugins", "pidfile" => "/tmp/wameku.pid"}
      end
    end
  end
end
