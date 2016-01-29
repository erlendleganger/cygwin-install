:-----------------------------------------------------------------------
@echo off
set basedir=%~dp0
set bindir=%basedir%..\..\..\bin
set gitrepobasedir=/g/github/repo
set daemonscript=%bindir%\gitd
set svc=gitd

:-----------------------------------------------------------------------
:create the daemon script
echo create %daemonscript%...
echo #!/bin/bash>%daemonscript%
echo /usr/bin/git daemon --reuseaddr --base-path=%gitrepobasedir% --export-all --verbose --enable=receive-pack %gitrepobasedir%>>%daemonscript%

:if you don't do this, you will get mysterious "not in whitelist" errors
%bindir%\dos2unix %daemonscript% 2>nul

:-----------------------------------------------------------------------
:install the script as a service
echo define %daemonscript% as service %svc%...
%bindir%\cygrunsrv  --remove %svc%
%bindir%\cygrunsrv  --install %svc% --path %bindir%/bash.exe --args %daemonscript% --desc "Git Daemon" --neverexits  --shutdown

:-----------------------------------------------------------------------
:start the service
:echo start %svc%...
:net stop %svc%
:net start %svc%
