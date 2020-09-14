@echo off
If [%1] == [] goto :eof
:loop
echo [.ShellClassInfo] > %1\Desktop.ini
echo IconFile=FolderIcon.ico >> %1\Desktop.ini
echo IconIndex=0 >> %1\Desktop.ini
for %%f in (%1\*.ico) do (
    if "%%~xf"==".ico" ren "%%f" "FolderIcon.ico" | attrib +h +s %1\"FolderIcon.ico"
)
attrib +S +H %1\desktop.ini
attrib +R +S %1
shift
if not [%1]==[] goto loop
ie4uinit.exe -ClearIconCache
ie4uinit.exe -show