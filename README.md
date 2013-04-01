#### Wameku client

This daemon runs on a remote host and communicates back to the mother ship via DRb.

The daemon is pluggable.  You can add any plugins to a `plugins/` directory.

The daemon will run each plugin on demand.


@todo need to turn plugin module into a gem to be included into a project
@todo decide whether to turn this into a gem or something else


##### Sample plugin  
```ruby

require "sys/cpu"
require_relative "plugin"

class CpuPlugin
  include Plugin
  include Sys

  def initialize
  end

  def cpu_load
    CPU.load_avg
  end

  def stats
    CPU.cpu_stats
  end

end
```

* Each plugin needs to return a string from it's instance methods


As you can see, each plugin must include `Plugin` "namespace this"
