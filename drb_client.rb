require 'drb'
require 'pp'
worker = DRbObject.new(nil, "druby://127.0.0.1:1337")
p worker.plugins
#p worker.run_me
a=worker.run_me
a.each do |i|
  pp i
end

p a.detect { |name| name[:host_name] }
