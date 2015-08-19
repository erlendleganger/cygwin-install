echo configure generic git settings
git config --global core.pager cat
git config --global core.autocrlf input
git config --global push.default simple
git config --global user.email erlend.leganger@gmail.com
git config --global user.name "Erlend Leganger"

#set credential helper, different for msysgit and cygwin
if [ "$(uname -s|grep -i cygwin)" ]; then
   echo configure credential helper for cygwin
   git config --global credential.helper winstore
   #install the command
   ./git-credential-winstore.exe -s
   sleep 2 #wait until the installer does its job
   #fix the path in global gitconfig
   perl -pi.bak -e "if(m/helper/){s,C:,/cygdrive/c,;s,\\\\,/,g;}" ~/.gitconfig
else
   #for msysgit; a bit simpler...
   echo configure credential helper
   git config --global credential.helper wincred
fi
echo done
