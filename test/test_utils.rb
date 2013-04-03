require_relative 'test_helper'

class TestUtils < Test::Unit::TestCase
  def setup
    @uhome = Wameku::Utils::AppHome
    @pid   = Wameku::Utils::Pid
  end
  def test_current_user
    assert @uhome.current_user
  end

  def test_app_config_path
    assert_equal(@uhome.app_config_path, File.join(ENV["HOME"], ".wameku"))
  end

  def test_app_plugin_path
    assert_equal(@uhome.app_plugin_path, File.join(ENV["HOME"], ".wameku", "plugins"))
  end

  def test_create_config_directory
    #assert_raise @uhome.create_config_directory
  end

  def test_create_plugin_directory
    
  end

  def test_create_pidfile
    @pid.create(1, TEST_PID)
    assert(File.exist?(TEST_PID))
  end

  def test_pidfie_cleanup
    Process.expects(:kill).with("KILL", 1)
    @pid.cleanup(1, TEST_PID)
    refute(File.exist?(TEST_PID))
  end

end
