@echo off
::------------------------------------------------------------------------
::get my file name, no extension
::set me=%~n0 
::get my file name, including extension:
set me=%~n0%~x0 
::get directory of this file, including trailing \
set bindir=%~dp0
set line=---------------------------------------------------------------------
:: --quiet-mode --no-startmenu --no-desktop --no-shortcuts 
echo %me%: initialise configuration:
set pkgdir=c:\original\cygwin
set rootdir=c:\opt\cygwin
set srcsite=http://cygwin.uib.no/ 
:: use 32bit version, 64bit not yet mature (Jan 2015)
::set setup=setup-x86_64.exe
set setup=%bindir%setup-x86.exe

::------------------------------------------------------------------------
::define list of packages to install, update:
set pkgs=binutils
set pkgs=%pkgs%,bzip2
set pkgs=%pkgs%,colorgcc
set pkgs=%pkgs%,curl
set pkgs=%pkgs%,cygutils
set pkgs=%pkgs%,expat
set pkgs=%pkgs%,expat-debuginfo
set pkgs=%pkgs%,gcc-core
set pkgs=%pkgs%,gcc-g++
set pkgs=%pkgs%,git
set pkgs=%pkgs%,git-completion
set pkgs=%pkgs%,rxvt
::set pkgs=%pkgs%,rxvt-unicode
set pkgs=%pkgs%,gzip
set pkgs=%pkgs%,unzip
set pkgs=%pkgs%,zip
set pkgs=%pkgs%,m4
set pkgs=%pkgs%,make
set pkgs=%pkgs%,vim
set pkgs=%pkgs%,mintty
set pkgs=%pkgs%,libxml
set pkgs=%pkgs%,libxml2-devel
set pkgs=%pkgs%,libexpat-devel
set pkgs=%pkgs%,libcrypt-devel

::------------------------------------------------------------------------
echo %me%: start installer, do the job:
%setup%  --quiet-mode --wait --no-desktop --local-package-dir %pkgdir% --site %srcsite% --root %rootdir% --upgrade-also --packages %pkgs%

::------------------------------------------------------------------------
::do the perl stuff
echo[
echo %line%
set script=perl-setup.sh
copy %bindir%%script% %rootdir%\tmp >nul
echo %me%: - observe that a terminal window now is shown
echo %line%
echo %me%: configure perl: start
echo %me%: - run 'time bash /tmp/%script%'
echo %me%: - wait, the job can take a few minutes
echo %me%: configure perl: end
echo %line%

::------------------------------------------------------------------------
::do the putty stuff
set exe=git-credential-winstore.exe
copy %bindir%%exe% %rootdir%\usr\bin >nul
set script=puttycyg-setup.sh
copy %bindir%%script% %rootdir%\tmp >nul
echo %me%: configure Putty: start
echo %me%: - run 'time bash /tmp/%script%'
echo %me%: - wait, the job takes a few seconds
echo %me%: - suggested shortcut target: C:\opt\putty\putty.exe -load cygwin
echo %me%: configure Putty: end
echo %line%
echo %me%: - when done, close the terminal window with 'exit'

::------------------------------------------------------------------------
::start a terminal for the commands above
::mintty - alternative terminal emulator
::%rootdir%\bin\mintty.exe -
%rootdir%\bin\run.exe -wait /usr/bin/rxvt.exe -display 127.0.0.1:0 -tn rxvt-cygwin -e /bin/bash --login

::------------------------------------------------------------------------
::ok, all done now
echo[
echo %me%: cygwin installation completed

