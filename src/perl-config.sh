line=------------------------------------------------------------------------
me=$(basename $0)
echo $me: start

#ensure the gcc programs exist in a *-4 version as well
printf "\n$me: set gcc names\n"
for s in gcc g++; do 
   src="/usr/bin/$s.exe"
   tgt="/usr/bin/$s-4.exe"
   [ ! -f $tgt ] && ln -s $src $tgt
done

printf "\n$me: get cpanm:\n"
#get cpanm, for module maintenance
curl -L http://cpanmin.us|perl - App::cpanminus;

#install required perl modules
for m in Error Log::Log4perl XML::Parser XML::Simple; do 
   printf "\n$line\n$me: install perl module $m:\n"
   cpanm -fv $m
   perldoc -l $m >/dev/null 2>&1
   if [ $? != 0 ]; then
      echo error: installation of module $m failed
      exit 1
   else
      echo info: installation of module $m ok
   fi
done

#done
echo $me: done
