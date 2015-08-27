#------------------------------------------------------------------------
l=------------------------------------------------------------------------
cygwin="$(uname -s|grep -i cygwin)"
cd $(dirname $0)

#------------------------------------------------------------------------
printf -- "$l\nconfigure generic git settings:\n"
git config --global core.pager cat
git config --global core.autocrlf input
git config --global push.default simple
cat<<EOT
Remember to configure your personal info in Git, for example:
git config --global user.name "Erlend Leganger"
git config --global user.email erlend.leganger@gmail.com
EOT

#------------------------------------------------------------------------
#set credential helper, different for msysgit and cygwin
if [ "$cygwin" ]; then
   printf -- "$l\nconfigure credential helper for cygwin\n"
   git config --global credential.helper winstore
   #install the command
   ./git-credential-winstore.exe -s
   sleep 2 #wait until the installer does its job
   #fix the path in global gitconfig
   perl -pi.bak -e "if(m/helper/){s,C:,/c,;s,\\\\,/,g;s,//,/,g;}" ~/.gitconfig
else
   #for msysgit; a bit simpler...
   echo configure credential helper
   git config --global credential.helper wincred
fi
echo done
