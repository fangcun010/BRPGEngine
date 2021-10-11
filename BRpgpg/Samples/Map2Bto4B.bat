..\tool\BBasic map2bto4b.bas
del temp.bas
..\tool\Blink map2bto4b.obj test.bin
del map2bto4b.obj
copy test.bin ..\sim\BBasic
cd ..\sim\debug
call gamdev.exe