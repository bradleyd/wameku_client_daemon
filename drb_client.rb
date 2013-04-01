require 'drb'
require 'pp'
worker = DRbObject.new(nil, "druby://127.0.0.1:1337")
p worker.plugins
#p worker.run_me
worker.run_me.each do |i|
  pp i
end
