@echo off
::file name, no extension
::set me=%~n0 
::file name, and extension:
set me=%~n0%~x0 

echo %me%: start
:: --quiet-mode --no-startmenu --no-desktop --no-shortcuts 
echo %me%: initialise configuration:
set pkgdir=c:\original\cygwin
set rootdir=c:\opt\cygwin
set srcsite=http://cygwin.uib.no/ 
set setup=setup-x86.exe
set setup=setup-x86_64.exe

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
set pkgs=%pkgs%,rxvt-unicode
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

echo[
set script=perl-setup.sh
copy %script% %rootdir%\tmp >nul
echo %me%: configure perl:
echo %me%: run 'bash /tmp/%script%' in the new window:
::%rootdir%\bin\mintty.exe -e /usr/bin/bash /tmp/%script%
%rootdir%\bin\mintty.exe -

echo %me%: done
