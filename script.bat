@echo off
set orig_file=MasterServers.vdf
set start_dir=..

set current_dir=%CD%

cd %start_dir%
for %%i in (rev_MasterServers.vdf MasterServers2.vdf MasterServers.vdf) do for /F %%j in ('dir %%i /s /b /a-d') do call:cpfile %current_dir%\%orig_file% %%j

cd %current_dir%

attrib -r %orig_file%
attrib -r script.bat
del %orig_file% script.bat

goto:eof

:cpfile
attrib -r %~2
copy %~1 %~2
attrib +r %~2
goto:eof
