@echo off
::get my file name, no extension
::set me=%~n0 
::get my file name, including extension:
set me=%~n0%~x0 

echo %me%: start
:: --quiet-mode --no-startmenu --no-desktop --no-shortcuts 
echo %me%: initialise configuration:
set pkgdir=c:\original\cygwin
set rootdir=c:\opt\cygwin
set srcsite=http://cygwin.uib.no/ 

:: use 32bit version, 64bit not yet mature (Jan 2015)
::set setup=setup-x86_64.exe
set setup=setup-x86.exe

echo %me%: define list of packages to install, update:
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

echo %me%: start installer, do the job:
%setup%  --quiet-mode --wait --no-desktop --local-package-dir %pkgdir% --site %srcsite% --root %rootdir% --upgrade-also --packages %pkgs%

::do the perl stuff
echo[
set script=perl-setup.sh
copy %script% %rootdir%\tmp >nul
echo %me%: configure perl: start
echo %me%: - observe that a terminal window now is shown
echo %me%: - run 'time bash /tmp/%script%' in the terminal window
echo %me%: - wait until the job completes, this can take 5-20min
echo %me%: - when done, close the terminal window with 'exit'

::start a terminal for the commands above
::mintty - alternative terminal emulator
::%rootdir%\bin\mintty.exe -
%rootdir%\bin\run.exe -wait /usr/bin/rxvt.exe -display 127.0.0.1:0 -tn rxvt-cygwin -e /bin/bash --login
echo %me%: configure perl: done

::ok, all done now
echo[
echo %me%: cygwin installation completed

