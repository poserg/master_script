@echo off
set orig_file=MasterServer.vdf
set start_dir=MasterServers

for %%i in (rev_MasterServers MasterServers2 MasterServers) do for /F %%j in ('dir %start_dir% /s /b %%i') do call:cpfile %orig_file% %%j

goto:eof

:cpfile
echo Copy %~1 to %~2
goto:eof