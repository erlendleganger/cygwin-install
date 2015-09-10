#------------------------------------------------------------------------
line=------------------------------------------------------------------------
me=$(basename $0)
echo $me: start

#------------------------------------------------------------------------
#modules to install
modules="
POSIX
Error 
Log::Log4perl
Cwd
File::Basename
File::Basename
Date::Simple
DateTime
Time::Piece
Time::Seconds
Text::Template
Time::Local
HTML::Entities
XML::Simple
XML::Parser
XML::Parser::Expat
SVG::TT::Graph
SVG::TT::Graph::BarHorizontal
LWP::Protocol::https
MediaWiki::API
MediaWiki::Bot
MediaWiki::DumpFile
"

#------------------------------------------------------------------------
#ensure the gcc programs exist in a *-4 version as well
printf "\n$me: set gcc names\n"
for s in gcc g++; do 
   src="/usr/bin/$s.exe"
   tgt="/usr/bin/$s-4.exe"
   [ ! -f $tgt ] && ln -s $src $tgt
done

#------------------------------------------------------------------------
printf "\n$me: get cpanm:\n"
#get cpanm, for module maintenance
curl -L http://cpanmin.us|perl - App::cpanminus;

#------------------------------------------------------------------------
#install required perl modules
for m in $modules; do
   printf "\n$line\n$me: install perl module $m:\n"
   cpanm -fv $m
   if [ $? != 0 ]; then
      echo error: installation of module $m failed
      exit 1
   else
      echo info: installation of module $m ok
   fi
   perldoc -l $m >/dev/null 2>&1
   if [ $? != 0 ]; then
      echo error: documentation for module $m not ok
      exit 1
   else
      echo info: documentation for module $m ok
   fi
done

#------------------------------------------------------------------------
#done
echo $me: done
