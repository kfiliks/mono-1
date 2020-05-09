git submodule update --init --recursive

export UNITY_THISISABUILDMACHINE=1
echo "Check if UNITY_THISISABUILDMACHINE is set"
echo $UNITY_THISISABUILDMACHINE

perl external/buildscripts/build_classlibs_osx.pl
if [ $? -eq 0 ]
then
  echo "mono build script ran successfully"
else
  echo "mono build script failed" >&2
  exit 1
fi

mkdir -p incomingbuilds/classlibs
cp -r ZippedClasslibs.tar.gz incomingbuilds/classlibs/
cd incomingbuilds/classlibs
tar -pzxf ZippedClasslibs.tar.gz
rm -f ZippedClasslibs.tar.gz
cd ../..