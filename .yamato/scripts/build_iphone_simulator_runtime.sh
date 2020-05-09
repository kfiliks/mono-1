git submodule update --init --recursive

export UNITY_THISISABUILDMACHINE=1
echo "Check if UNITY_THISISABUILDMACHINE is set"
echo $UNITY_THISISABUILDMACHINE

bash external/buildscripts/build_runtime_iphone.sh --simulator-only
if [ $? -eq 0 ]
then
  echo "mono build script ran successfully"
else
  echo "mono build script failed" >&2
  exit 1
fi

mkdir -p incomingbuilds/ios_simulator
cp -r builds/* incomingbuilds/ios_simulator/