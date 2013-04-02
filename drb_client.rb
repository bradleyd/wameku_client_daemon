require 'drb'
require 'pp'
$SAFE = 1  # disable eval() and friends
worker = DRbObject.new(nil, "druby://127.0.0.1:1337")
p worker
p worker.plugins
#p worker.run_me
a=worker.run_me
a.each do |i|
  pp i
end

p a.detect { |name| name[:host_name] }
p a
