require_relative 'test_helper'

module Plugin
  def run
    results = {}
    load_methods.each do |meth|
      results[meth] = self.public_send(meth)
    end
    results
  end  

  private
  def load_methods
    #(methods.sort - Object.methods).delete_if { |x| x == :run }
    self.class.instance_methods(false)
  end
end

class Foo
  include Plugin

  def initialize 
  end

  def foobar
    "foobar"
  end
end


class TestPlugin < Test::Unit::TestCase
  def setup
    @foo_plugin = Foo.new
  end

  def test_plugin_has_run
    assert_respond_to(@foo_plugin, :run)
  end

  def test_plugin_run_returns_output
    #@foo_plugin.expects(:run).returns({"foobar")
    assert_equal @foo_plugin.run, {foobar: "foobar"}
  end
end
