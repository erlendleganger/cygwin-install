@echo off
::------------------------------------------------------------------------
::get my file name, no extension
::set me=%~n0 
::get my file name, including extension:
set me=%~n0%~x0 
::get directory of this file, including trailing \
set basedir=%~dp0
set xferdir=%basedir%xfer
set bindir=%basedir%bin
set srcdir=%basedir%src
set line=---------------------------------------------------------------------
:: --quiet-mode --no-startmenu --no-desktop --no-shortcuts 
echo %me%: initialise configuration:
set id=cygwin
set pkgdir=c:\original\%id%
set rootdir=c:\opt\%id%
set srcsite=http://cygwin.uib.no/ 
:: use 32bit version, 64bit not yet mature (Jan 2015)
::set setup=setup-x86_64.exe
set setup=%bindir%\setup-x86.exe
set zip=%bindir%\7za.exe
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set dtg=%ldt:~0,8%T%ldt:~8,6%
set zipball=%xferdir%\cygwin-%dtg%.zip

::------------------------------------------------------------------------
::define list of packages to install, update:
set pkgs=binutils
set pkgs=%pkgs%,dos2unix
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
set pkgs=%pkgs%,nano
set pkgs=%pkgs%,mintty
set pkgs=%pkgs%,libxml
set pkgs=%pkgs%,libxml2-devel
set pkgs=%pkgs%,libexpat-devel
set pkgs=%pkgs%,libcrypt-devel

::------------------------------------------------------------------------
echo %me%: start installer, do the job:
%setup%  --quiet-mode --wait --no-desktop --local-package-dir %pkgdir% --site %srcsite% --root %rootdir% --upgrade-also --packages %pkgs%

::------------------------------------------------------------------------
::do the cygwin stuff
echo[
echo %line%
set script=cygwin-config.sh
copy %srcdir%\%script% %rootdir%\tmp >nul
echo %me%: - observe that a terminal window now is shown
echo %line%
echo %me%: do this to configure Cygwin:
echo %me%: - run 'time bash /tmp/%script%'
echo %me%: - wait, the job takes a few seconds
echo %me%: - done
echo %line%

::------------------------------------------------------------------------
::do the perl stuff
echo[
echo %line%
set script=perl-config.sh
copy %srcdir%\%script% %rootdir%\tmp >nul
echo %me%: - observe that a terminal window now is shown
echo %line%
echo %me%: do this to configure Perl:
echo %me%: - run 'time bash /tmp/%script%'
echo %me%: - wait, the job can take a few minutes
echo %me%: - done
echo %line%

::------------------------------------------------------------------------
::do the putty stuff
set exe=git-credential-winstore.exe
copy %srcdir%\%exe% %rootdir%\usr\bin >nul
set script=puttycyg-setup.sh
copy %srcdir%\%script% %rootdir%\tmp >nul
echo %me%: do this to configure Putty:
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
echo zip up all files:
cd %rootdir%\..
%zip% a %zipball% %id%
copy %srcdir%\cygwin-readme.txt %xferdir%\cygwin-%dtg%-readme.txt

::------------------------------------------------------------------------
::ok, all done now
echo[
echo %me%: cygwin installation completed

