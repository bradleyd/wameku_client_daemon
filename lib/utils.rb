require "etc"
module Wameku
  module Utils

    # handles all the app disk structure
    class AppHome
      class << self

        def current_user
          Etc.getlogin
        end

        def home_directory
          Dir.home current_user
        end

        def app_config_path
          File.join(home_directory, ".wameku")
        end

        def app_plugin_path
          File.join(home_directory, ".wameku", "plugins")
        end

        def create_config_directory
          Dir.mkdir(app_config_path) unless File.directory?(app_config_path)
        end

        def create_plugin_directory
          Dir.mkdir(File.join(app_config_path, "plugins")) unless File.directory?(File.join(app_config_path, "plugins"))
        end
      end
    end

    # handles all pid creation and destruction
    class Pid
      class << self
        def create(pid, pidfile)
          begin
            File.open pidfile, "w" do |f|
              f.write pid
            end
          rescue ::Exception => e
            $stderr.puts "While writing the PID to file, unexpected #{e.class}: #{e}"
            Process.kill "KILL", pid
          end
        end

        # shamlessly stolen from https://gist.github.com/sbusso/1978385
        def cleanup(pid, pidfile)
          begin
            opid = open(pidfile).read.strip.to_i
            File.delete pidfile
            Process.kill "KILL", opid
            true
          rescue Errno::ENOENT
            $stdout.puts "#{pidfile} did not exist: Errno::ENOENT"
            true
          rescue Errno::ESRCH
            $stdout.puts "The process #{opid} did not exist: Errno::ESRCH"
            true
          rescue Errno::EPERM
            $stderr.puts "Lack of privileges to manage the process #{opid}: Errno::EPERM"
            false
          rescue ::Exception => e
            $stderr.puts "While signaling the PID, unexpected #{e.class}: #{e}"
            false
          end
        end
      end
    end
  end
end
