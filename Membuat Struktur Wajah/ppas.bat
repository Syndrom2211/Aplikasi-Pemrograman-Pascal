@echo off
SET THEFILE=d:\firdam~1\latiha~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  D:\FIRDAM~1\rsrc.o -s   -b base.$$$ -o d:\firdam~1\latiha~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
