if test $# -eq 0 
then 
	OCARINA_INSTALL=$(pwd)/ocarina_install
else 
	OCARINA_INSTALL=$1
fi

echo "Ocarina install directory: $OCARINA_INSTALL"

cd ocarina
./support/reconfig
./configure --prefix=$OCARINA_INSTALL
make
make install
cd ..

