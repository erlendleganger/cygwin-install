cygwin-install
==============

A central store for the files I use to configure a Cygwin installation

Usage
=====

1. Clone this repo into for example c:\original\cygwin-install.
2. Verify the pkgdir, rootdir settings in cygwin-setup.cmd; 
   modify as required.   
3. Verify the tgtdir,pkgdir settings in puttycyg-setup.sh;
   modify as required.   
4. Start a CMD window as Administrator.
5. In the CMD window, run the cygwin-setup.cmd file.
6. Read the instructions from cygwin-setup.cmd to install perl, putty.
7. Start the installed putty.exe and open the Cygwin session.
8. Start using Cygwin.

Git stuff
========
Recommended settings:
* git config core.pager cat
* git config core.autocrlf true
* git config push.default simple
