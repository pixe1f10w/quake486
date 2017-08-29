Quake for the Dingoo A320 Native OS - v0.03
-------------------------------------------

Compiled with the Flatmush SDK and based on SDL Quake by Sam Lantinga with fixed point routines from Pocket Quake by Dan East.

Saves modified to use a buffer as suggested by Harteex, many thanks to him.

I tried to use as few of the original source files as possible and intend to remove all references to i386/windows/glquake, and stub anything that is not absolutely needed.  Calls to existing stub functions have been removed completely to keep things tidy (there were quite a few) but the functions have not been removed.

The particles were not being draw correctly and I ened up creating a test program to check the output of rand().
The output showed that the result was being truncated somehow, and in a way that mirrored the error in Quake exactly.  My solution is to change something like Rand() % 256 into (Rand() % 256000)/1000.  This makes things look better but I've not applied the fix to all the random values, just those that caused the biggest problems. More work is needed here!

thewub(at)gmail(dot)com - 30/12/13

