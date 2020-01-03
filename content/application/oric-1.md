+++
categories = ["Oric 1"]
date = "1983-12-01"
description = "Oric 1, Bar graph drawing program from 1983"
keywords = ["Webmin"]
title = "Oric 1 - Bar graph drawing program"
+++
Way back in 1983, and here's my first open source code as published in the Oric Owner magazine.
<!--more-->

```basic
3   POKE #26A,35
5   TEXT: PAPER 0:INK 7
10  FOR T=0 TO 7
20  B$(T)=CHR$(T+144): F$(T)=CHR$(T+ 128)
40  NEXT
100 CLS: PRINT
110 PRINT SPC(15)B$(7)SPC(12)B$(0)
120 PRINT SPC(5) B$(7) F$(0) "BAR CHARTS" B$(0)
130 PRINT SPC(15) B$(7) SPC(12) B$(0)
131 PRINT:PRINT "HOW MANY ITEMS";;INPUT U: IF U>7 OR U<0 THEN POKE #268,5:GOTO 131
132 POKE #268,5
140 PRINT:PRINT "ENTER THE DATA:"
145 PRINT SPC(17)": (1 TO 25), ITEM"
150 FOR M=0 TO U-1 155 IF PEEK(#268)>25 THEN POKE #268,18
160 INPUT "...............:"; A(M), A$(M)
170 IF A(M)>25 THEN EXPLODE: GOTO 1600
172 IF A(M)<0 THEN EXPLODE: GOTO 160
175 IF LEN(A$(M))>9 THEN SHOOT: GOTO 160
180 NEXT
190 POKE #268,4: FOR Q=1 TO 22: PRINT SPC(46): NEXT
200 FOR T= 0 TO U-1
210 FOR E=27 TO 28—A(T) STEP-1
220 PLOT E, (T+1).3+3, B$(1)+B$(0)
230 NEXT
240 PLOT 30, (T+1).3+3, A$(T)
250 NEXT
260 POKE #268,26:PRINT "AGAIN (YIN)?"
270 GET A$: IF A$="Y" THEN RUN
280 IF A$="N" THEN END ELSE 270 
```

_I can't believe that some 37 years later I've just noticed a mistake on line 170!_

### Magazine front page

![](/img/oric-1/Oric Magazine 1983 - Front cover.jpg)

### Magazine page

![](/img/oric-1/Oric Magazine 1983 - K Golding Bar Graph.jpg)
