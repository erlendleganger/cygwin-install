Installation instructions for the cygwin package:
- create a target directory, for example c:\opt
- unzip the cygwin*.zip file into c:\opt, should give you c:\opt\cygwin
- create a shortcut with for example the following settings:
  c:\opt\cygwin\bin\run.exe -wait /usr/bin/rxvt.exe -display 127.0.0.1:0 -tn rxvt-cygwin -e /bin/bash --login
- change the icon for the shortcut to the one in c:\opt\cygwin\Cygwin.ico