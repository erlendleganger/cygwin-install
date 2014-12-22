#ensure the gcc programs exist in a *-4 version as well
for s in gcc g++; do 
   src="/usr/bin/$src"
   tgt="/usr/bin/$src-4"
   [ ! -f $tgt ] && ln -s $src $tgt
done

#get cpanm, for module maintenance
curl -L http://cpanmin.us|perl - App::cpanminus;

#install required perl modules
for m in Error Log::Log4perl XML::Parser; do 
   cpanm -fv $m
done
