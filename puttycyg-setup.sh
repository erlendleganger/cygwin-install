#------------------------------------------------------------------------
#settings
tgtdir=/cygdrive/c/opt/putty
pkgdir=/cygdrive/c/original/cygwin-install
srcfile=$pkgdir/puttycyg-20101029.zip
puttycygdir=puttycyg-20101029

#------------------------------------------------------------------------
#initial checks
if [ ! -d $pkgdir ]; then
   echo cannot find $pkgdir; exit 1
fi
if [ ! -f $srcfile ]; then
   echo cannot find $srcfile; exit 1
fi

#------------------------------------------------------------------------
echo initialise $tgtdir
rm -rf $tgtdir
mkdir -p $tgtdir
echo unzip $srcfile
cd /tmp
rm -rf $puttycygdir
unzip $srcfile
echo copy files to $tgtdir
cp -p $puttycygdir/* $tgtdir
find $tgtdir -type f
echo done
