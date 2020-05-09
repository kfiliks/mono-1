git submodule update --init --recursive

export UNITY_THISISABUILDMACHINE=1
echo "Check if UNITY_THISISABUILDMACHINE is set"
echo $UNITY_THISISABUILDMACHINE

perl external/buildscripts/build_runtime_osx.pl
if [ $? -eq 0 ]
then
  echo "mono build script ran successfully"
else
  echo "mono build script failed" >&2
  exit 1
fi

mkdir -p incomingbuilds/osx-i386
cp -r builds/* incomingbuilds/osx-i386/