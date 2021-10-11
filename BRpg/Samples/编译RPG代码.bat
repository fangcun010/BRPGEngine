..\tool\BBasic rpg.bas
del temp.bas
..\tool\Blink rpg.obj test.bin
del rpg.obj
copy test.bin ..\sim\BBasic
cd ..\sim\debug
call gamdev.exe