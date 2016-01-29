Initial installation
--------------------
This is what you do if you install Cygwin for the first time on your PC.
- create a target directory, for example c:\opt
- unzip the cygwin*.zip file into c:\opt, this should give you c:\opt\cygwin
- create a shortcut named "Cygwin rxvt" with the following command line:
  c:\opt\cygwin\bin\run.exe -wait /usr/bin/rxvt.exe -display 127.0.0.1:0 -tn rxvt-cygwin -e /bin/bash --login
- change the icon for the shortcut to the one in c:\opt\cygwin\Cygwin.ico
- use the shortcut to start Bash and then run "bash /opt/cygwin/src/cygwin-config.sh"

Upgrade installation
--------------------
This is what you do if you have an existing Cygwin installation on your PC.
- log out of all cygwin windows, stop all cygwin processes
- rename c:\opt\cygwin to c:\opt\cygwin.old
- unzip the new cygwin*.zip into c:\opt, this should give you c:\opt\cygwin
- copy c:\opt\cygwin.old\home into c:\opt\cygwin\ - this is your home directory
- log in to Cygwin and verif that all works as before

Configure Putty
---------------
The included Putty has a Cygwin mode which allows for using Putty to log 
in to the Cygwin session, could be useful.
- log in to cygwin
- run "bash /opt/cygwin/src/puttycyg-setup.sh"
- start c:\opt\putty\putty.exe, create a session named "cygwin" of type 
  Cygterm and set the host to "-"
- in Windows, load c:\opt\cygwin\opt\cygwin\src\putty-cygwin-session.reg 
  to set colours for the session named "cygwin"
- start the cygwin session in Putty and verify that you get logged in
- if required, create a shortcut to putty.exe with parameter "-load cygwin", 
  this will automically start the cygwin session.

Configure the git daemon
------------------------
There is a setup configured to run the Git Daemon as a Windows service
to serve git operations from a set of bare Git repos, for example on a
USB drive. The default is that the Git repos are found in G:\github\repo
(=/g/github/repo).
- start a cmd window as Administrator
- review the file c:\opt\cygwin\opt\cygwin\src\gitd-install-svc.cmd
- update the gitrepobasedir setting to point to the location of the Git bare
  repos that shall be served by the daemon.
- run c:\opt\cygwin\opt\cygwin\src\gitd-install-svc.cmd, observe that 
  no errors are displayed
- start Cygwin and run /bin/gitd manually to check that all is OK; if
  asked, allow gitd access through the firewall
- make some git operations (clone, pull, push), just to see that it works; 
  you see some output from gitd
- kill gitd
- in the cmd window, run "net start gitd" to start the service
- make some git operations again (clone, pull, push), just to see that 
  it still works, now via the Windows service

