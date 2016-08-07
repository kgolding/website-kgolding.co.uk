+++
categories = ["SMC Gateway", "Hytera", "Integration", "golang"]
date = "2015-10-01T09:00:00+01:00"
description = "National Portrait Gallery uses SMC Gateway for two-way radio integration"
keywords = ["SMC Gateway", "Hytera", "Mitel"]
title = "National Portrait Gallery (NPG)"

+++

Working with two-way radio dealer [Wall to Wall Communications Ltd](http://walltowallcomms.co.uk/) and using my
[SMC Gateway](http://smc-gateway.com) product, we provided three key integrations to aid in the safety of staff and vistors.

All three integrations were engineered using one standard off the shelf [SMC Gateway](http://smc-gateway.com), making
the material cost low, and by using the built-in graphical application builder no software development was required. 

### Fire alert/alarm notification

The existing fire alarm system was integrated using its serial printer port. Messages are inspected by the Gateway
and high priority ones are sent to the staff on their [Hytera](http://hytera.co.uk/) DMR radios.

### Art protection alarm notification

The gallery has a sophisticated alarm system that monitors all of the pieces of art and pictures for multiple
conditions including temperature, movement, vibration and more. Using XML over TCP/IP the Gateway receives alarms,
which are sent to different security personal depending on the location of the alarm. This lets staff quickly respond.

### Telephony integration of Mitel PABX to Hytera two way radios
In the event of an issue requiring the attendance of third partys such as the emergency services, the Gateway provides
the means for a two-radio user to make (and receive) a telephone call via the galleries Mitel telephone system.
