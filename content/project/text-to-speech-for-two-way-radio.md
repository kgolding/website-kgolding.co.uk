+++
categories = ["SMC Gateway", "Motorola", "golang"]
date = "2016-08-07T18:06:49+01:00"
description = "Speaking text message for retail two-way radios"
keywords = ["text-to-speech", "Motorola", "two-way radio"]
title = "Text to speech for two-way radios"
+++

Whilst two-way radios are used in retail environments, many of the radios are entry level and rarely feature text
messaging nor the displays to show messages. Also, staff do not want to be seen forever checking their radios for
messages.

After being asked to provide a text-to-speech for a radio dealer I researched the available options and sadly all
of the offline solutions were either very expensive or very poor quality.

By chance, I saw a TV program where a voice artist was recording the audio for the Tom-Tom range of navigation devices,
and this got me thinking rather than using synthesised audio why not use real audio, and chain together the words!

I researched how many words I might need and this came out to around 300 for the given clients needs, including the
common words such as 'the', 'is', 'of' etc. I also added numbers, including an algorithm to read numbers like a human
does, eg 126 is spoken as "one", "hundred", "twenty", "six".

This project was written in golang to run on a low-powered ARM CPU. The total size of the application and all the 300+
sound files came in at just 20Mb which was very acceptable, and the generated audio is very clear.

