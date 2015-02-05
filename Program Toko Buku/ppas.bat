@echo off
SET THEFILE=c:\users\edo\desktop\projec~1\sorting.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  C:\Users\EDO\Desktop\PROJEC~1\rsrc.o -s   -b base.$$$ -o c:\users\edo\desktop\projec~1\sorting.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
