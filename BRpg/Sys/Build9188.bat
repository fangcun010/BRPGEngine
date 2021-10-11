..\tool\BBasic -r test.bas
del temp.bas
..\tool\BBtool Test.obj Testl.obj a
..\tool\BLink -r testl.obj test.bin
copy test.bin ..\sim\BBasic
cd ..\sim\debug
call GamDev.exe
