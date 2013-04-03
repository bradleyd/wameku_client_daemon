#### Wameku client

This daemon runs on a remote host and communicates back to the mother ship via DRb.

The daemon is pluggable.  You can add any plugins to a `plugins/` directory.

The daemon will run each plugin on demand.


@ Todo need to turn plugin module into a gem to be included into a project
@ Todo decide whether to turn this into a gem or something else


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


##### Build instructions

Create a tar.gz of directory

```bash
 tar cavf wameku-client-daemon-0.x.tar.gz wameku-client-daemon-0.x
```

Next--make sure you are in package root dir--create the template debian/ system

```bash
h_make -c gpl -s -b -f ../wameku-client-daemon-0.x.tar.gz
```

Remove unnecessary files
```bash
rm debian/*.ex debian/*.EX debian/READ* debian/dirs
```

edit the debian/rules if needed
```bash
#!/usr/bin/make -f
# -*- mode: makefile; coding: utf-8 -*-

include /usr/share/cdbs/1/rules/debhelper.mk
include /usr/share/ruby-pkg-tools/1/class/ruby-setup-rb.mk
```

change debian/control to liking


Then build source 
```bash
debuild -us -uc
```

#### one note--need ruby 1.8 to use these commands.  I soft linked 
```bash
sudo ln -s /usr/bin/1.9.1 /usr/bin/1.8
```

it is a hack, but worked!
# @todo need to convert to gem and maybe use gem2deb
