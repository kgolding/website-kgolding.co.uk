+++
categories = []
date = "2019-12-02"
description = "Decoder takes a byte array and provides safe & simple functions to read different types, and keeps track of the last read position."
keywords = ["GO", "Protocols"]
title = "Decoding binary data packets in Go"
+++

Decoder takes a byte array and provides safe & simple functions to read different types, and keeps track of the last read position.
<!--more-->

**What about go's built in binary package?** Go's built in binary package allows decoding and encoding fixed lenghts packets from/to structs, but it does not handle variable lenght data as is often seen in over the wire protocols.

**https://github.com/kgolding/go-decoder**


### Example usage

This code will safely decode the following packet which contains a Uint16 value and a C style null terminated string:

> `02 01 ff 65 66 67 00 03` = `<STX> 01ff ABC <NULL> <ETX>`



``` go
// Decode the packet, accessing the elements in the order they appear
if packet.Byte() != decoder.STX {
	log.Fatalln("Missing STX")
}

myUint16 := packet.Uint16()
myString := packet.CString()

if packet.Byte() != decoder.ETX {
	log.Fatalln("Missing ETX")
}

// Check if there were any errors along the way
if err := packet.Err(); err != nil {
	log.Fatalln(err)
}
```