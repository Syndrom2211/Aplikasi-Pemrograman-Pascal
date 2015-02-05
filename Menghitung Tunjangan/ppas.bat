@echo off
SET THEFILE=d:\datama~1\firdam~1\mi63e3~1\daftar~1.exe
echo Linking %THEFILE%
c:\dev-pas\bin\ldw.exe  -s   -b base.$$$ -o d:\datama~1\firdam~1\mi63e3~1\daftar~1.exe link.res
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occured while assembling %THEFILE%
goto end
:linkend
echo An error occured while linking %THEFILE%
:end
