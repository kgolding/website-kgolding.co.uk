+++
title = "dmesg as user"
description = "Run dmesg as non-privileged/normal user"
tags = ["linux", "cli"]
+++

`dmesg` is a handy command for example to see the what name has been given to a plugged in device such as a memory card or USB serial adapter. But, you normally need to be root to run it!

<!--more-->

1. `sudo nano /etc/sysctl.d/10-dmesg.conf`
1. Paste in `kernel.dmesg_restrict = 0`
1. Exit and save
1. `sudo service procps restart`

Don't forget you can run `dmesg -w` to watch events as they happen in real time.