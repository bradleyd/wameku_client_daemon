require "yaml"
module Wameku
  class Config
    def self.load(config_path=nil)
      begin
        YAML.load_file(File.join(Utils::AppHome.app_config_path, "wameku.yml"))
      rescue Errno::ENOENT => e
        YAML.load_file(File.join(Utils::AppHome.home_directory, "wameku.yml"))
      end
    end
  end
end
