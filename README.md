#### Wameku client

This daemon runs on a remote host and communicates back to the mother ship via DRb.

The daemon is pluggable.  You can add any plugins to a `plugins/` directory.

The daemon will run each plugin on demand.


@Todo need to turn plugin module into a gem to be included into a project
@Todo decide whether to turn this into a gem or something else


##### Sample plugin  

a plugin can have any instance methods you wish.  They only have to return a string

As you can see, each plugin must include `Plugin` "namespace this"

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


