Initial installation
--------------------
- create a target directory, for example c:\opt
- unzip the cygwin*.zip file into c:\opt, should give you c:\opt\cygwin
- create a shortcut named "Cygwin rxvt" with the following command line:
  c:\opt\cygwin\bin\run.exe -wait /usr/bin/rxvt.exe -display 127.0.0.1:0 -tn rxvt-cygwin -e /bin/bash --login
- change the icon for the shortcut to the one in c:\opt\cygwin\Cygwin.ico
- use the shortcut to start Bash and then run "bash /opt/cygwin/src/cygwin-config.sh"

Upgrade installation
--------------------
- log out of all cygwin windows, stop all cygwin processes
- rename c:\opt\cygwin to c:\opt\cygwin.old
- unzip the new cygwin*.zip into c:\opt, should give you c:\opt\cygwin
- copy c:\opt\cygwin.old\home into c:\opt\cygwin\ - this is your home directory
- log in to cygwin and verif that all works as before

Configure putty
---------------
- log in to cygwin
- run "bash /opt/cygwin/src/puttycyg-setup.sh"
- in Windows, load c:\opt\cygwin\opt\cygwin\src\putty-cygwin-session.reg to set colours
- start c:\opt\putty\putty.exe, create a session named "cygwin" of type Cygterm and set the host to "-"
- start the cygwin session in Putty and verify that you get logged in
- if required, create a shortcut to putty.exe with parameter "-load cygwin"