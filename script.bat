@echo off
set orig_file=tmp.vdf
set start_dir=..

call:generateOrigFile

set current_dir=%CD%

cd %start_dir%
for %%i in (rev_MasterServers.vdf MasterServers2.vdf MasterServers.vdf) do for /F %%j in ('dir %%i /s /b /a-d') do call:cpfile %current_dir%\%orig_file% %%j

cd %current_dir%

attrib -r %orig_file%
attrib -r script.bat
del %orig_file% script.bat

goto:eof

:cpfile
attrib -h -r %~2
copy %~1 %~2
attrib +h +r %~2
goto:eof

:generateOrigFile
echo "MasterServers" > %orig_file%
echo { >> %orig_file%
echo  "hl2" >> %orig_file%
echo  { >> %orig_file%
echo   "0" >> %orig_file%
echo   { >> %orig_file%
echo   "addr"  "ms.cs-viewer.ru:27011" >> %orig_file%
echo   } >> %orig_file%
echo  } >> %orig_file%
echo  "hl1" >> %orig_file%
echo  { >> %orig_file%
echo "0" >> %orig_file%
echo   { >> %orig_file%
echo    "addr"  "ms.cs-viewer.ru:27010" >> %orig_file%
echo   } >> %orig_file%
echo   "1" >> %orig_file%
echo   { >> %orig_file%
echo    "addr"  "ms.cs-viewer.ru:27010" >> %orig_file%
echo   } >> %orig_file%
echo   "2" >> %orig_file%
echo   { >> %orig_file%
echo    "addr"  "ms.cs-viewer.ru:27010" >> %orig_file%
echo   } >> %orig_file%
echo  } >> %orig_file%
echo } >> %orig_file%
goto:eof
