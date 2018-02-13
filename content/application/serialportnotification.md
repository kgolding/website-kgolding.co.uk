+++
categories = []
date = "2018-02-12"
description = "I have to use serial ports a lot in my day to day work, and given the modern day PC's total lack of these ports I use USB to Serial adaptors."
keywords = ["Windows", "B4J"]
title = "Serial port popup notification for Windows"
+++

I have to use serial ports a lot in my day to day work, and given the modern day PC's total lack of these ports I use
USB to Serial adaptors. These work really well but depending on which adaptor gets plugged into which port, the assigned
virtual serial is always a mystery and I result in opening up the Windows device manager to see what has been assigned.

So, my solution was to write a system tray application that looks out for a new serial port to appear and then flash a
notification with the assigned name such as "COM1".

![screenshot](/img/serialportnotification/screenshot.png)

I wrote the application in [B4J](https://www.b4x.com/b4j.html), which is a VB6 like IDE that I've used on a few projects now, and it's proven to produce
reliable applications, albeit a bit RAM hungry as the application runs under Java (but is written in BASIC).

The compiled application and source code is at https://github.com/kgolding/b4j-serialportnotification
