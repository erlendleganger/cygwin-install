#------------------------------------------------------------------------
#settings
tgtdir=/c/opt/putty
srcfile=puttycyg-20101029.zip
puttycygdir=puttycyg-20101029

#------------------------------------------------------------------------
cd $(dirname $0)

#------------------------------------------------------------------------
#initial checks
if [ ! -f $srcfile ]; then
   echo cannot find $srcfile; exit 1
fi

#------------------------------------------------------------------------
echo initialise $tgtdir
rm -rf $tgtdir
mkdir -p $tgtdir
echo unzip $srcfile
rm -rf $puttycygdir
unzip $srcfile
echo copy files to $tgtdir
cp -p $puttycygdir/* $tgtdir
rm -rf $puttycygdir
find $tgtdir -type f
echo done
