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
7. Putty setup:
  a. Start the installed c:\opt\putty\putty.exe
  b. Create a session called cygwin, use host name "-" (a dash) and Connection
     type: Cygterm.
  c. Create a shortcut to load this: "c:\opt\putty\putty.exe -load cygwin"
  d. Load proper colours using the reg key file putty-cygwin-session.reg
  e. Use the shortcut and verify that Cygwin starts with proper colours
8. Start using Cygwin.

Git stuff
=========
All of the settings below will be automatically set for Msysgit and Cygwin
using the script git-config.sh; just run this script. 

Recommended settings:
* git config core.pager cat
* git config core.autocrlf input
* git config push.default simple
* git config --global user.email your.name@domain.com
* git config --global user.name "Your Name"

Git token authentication
========================
This is also taken care of by the git-config.sh script.
* For msysgit: git config --global credential.helper wincred. At the next push, the username and password (=the app token) will be saved.
* Form cygwin git: git config --global credential.helper winstore. This uses the file git-credential-winstore.exe (from https://gitcredentialstore.codeplex.com/releases/view/106064) as a helper for the credentials. At the next push, the Github username and password (= app token) will be saved by Windows.
