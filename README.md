#### Wameku client

This daemon runs on a remote host and communicates back to the mother ship via DRb.

The daemon is pluggable.  You can add any plugins to a `plugins/` directory.

The daemon will run each plugin on demand.




##### Sample plugin  

a plugin can have any instance methods you wish.  They only have to return a string

As you can see, each plugin must include `WakekuPlugin::Common`

```ruby

require "sys/cpu"
require "wameku_plugin"

class CpuPlugin
  include WamekuPlugin::Common
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


