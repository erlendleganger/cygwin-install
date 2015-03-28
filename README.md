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
=========
Recommended settings:
* git config core.pager cat
* git config core.autocrlf true
* git config push.default simple
* git config --global user.email your.name@domain.com
* git config --global user.name "Your Name"

Git token authentication
========================
* For msysgit: git config --global credential.helper wincred. At the next push, the username and password (=the ap token) will be saved.
* Form cygwin git: git config --global credential.helper winstore. This uses the file git-credential-winstore.exe (from https://gitcredentialstore.codeplex.com/releases/view/106064) as a helper for the credentials. At the next push, the Github username and password (= app token) will be saved by Windows.
git config user.email erlend.leganger@gmail.com
