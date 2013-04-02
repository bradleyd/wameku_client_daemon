require "yaml"
module Wameku
  class Config
    def self.load
      YAML.load_file(File.dirname(__FILE__) + "/../etc/wameku.yml")
    end
  end
end
