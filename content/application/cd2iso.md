+++
categories = [""]
date = "2002-01-01"
description = "Webmin module for creating ISO's from CD's"
keywords = ["Webmin"]
title = "Webmin module for creating ISO images from CD's"
+++

This [Webmin](http://webmin.com/) module allows you to copy a data CD to a standard iso image format that can then be burnt to a cd using standard CD writing software (cdrecord, Nero etc).
<!--more-->

cd2iso can also save a text file with any users comments about the cd along side the iso image for future reference
(useful for cd keys etc).

Additionally cd2iso will create a directory and mount the iso image (read only) in this new directory allowing you to
browse the data on the CD. If you then share this directory using samba you now have both a backup of your CD and
a networkable copy.

*Download: [Version 0.1beta](/download/cd2iso/cd2iso.wbm)*

### Screenshots

![](/img/cd2iso/screenshot1.gif)

![](/img/cd2iso/screenshot2.gif)

### License

cd2iso was written by Kevin Golding and is released under the BSD license.
