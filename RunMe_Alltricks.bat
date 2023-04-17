@ECHO OFF

Title AllTricks Presents
goto :main
:main
ECHO                        AllTricks(@santoshhh000) Presents Fastboot file for:-
ECHO                        -------------------------------------
ECHO 1. Root using magisk patched boot img
ECHO 2. Unroot using your current rom's stock boot.img
ECHO 3. Clean root/unroot folders
ECHO 4. Exit
set /p input= Enter your choice as 1,2,3 or 4 only  

cls
if %input%==1 goto :root
if %input%==2 goto :unroot
if %input%==3 goto :cleanfolder
if %input%==4 (exit /b 0)
if not %input%==1 if not %input%==2 if not %input%==3 if not %input%==4  goto :main
:unroot
ECHO UnRooting...
ECHO Copy the current rom's stock boot.img file in opened folder or unroot folder
%SystemRoot%\explorer.exe .\unroot\ 
pause 5
if exist .\unroot\*.img (move .\unroot\*.img .\unroot\boot.img) else (goto :unroot)
pause 5
if exist .\unroot\boot.img (fastboot flash boot .\unroot\boot.img) else (goto :unroot)
pause 5 
fastboot reboot
pause 5
cls
goto :main
exit /b 0


:root
ECHO Root using Magisk
ECHO Copy the magisk patched file in opened folder or root folder
%SystemRoot%\explorer.exe .\root\ 
ECHO If copied 
pause 5
if exist .\root\*.img (move .\root\*.img .\root\magisk.img) else (goto :root)
pause 5
if exist .\root\magisk.img (fastboot flash boot .\root\magisk.img) else (goto :root)
pause 5 
fastboot reboot
pause 5
cls
goto :main
exit /b 0

:cleanfolder
del /P .\root\*
del /P .\unroot\*
cls
goto :main