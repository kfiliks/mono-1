sudo apt-get install -y schroot
sudo apt-get install -y binutils debootstrap
sudo apt-get install -y curl
sudo apt-get install -y m4
git submodule update --init --recursive
# try again in case previous update failed
git submodule update --init --recursive

export UNITY_THISISABUILDMACHINE=1
echo "Check if UNITY_THISISABUILDMACHINE is set"
echo $UNITY_THISISABUILDMACHINE

perl external/buildscripts/build_runtime_linux.pl -build64=1
if [ $? -eq 0 ]
then
  echo "mono build script ran successfully"
else
  echo "mono build script failed" >&2
  exit 1
fi

echo "Making directory incomingbuilds/linux64"
mkdir -p incomingbuilds/linux64
ls -al incomingbuilds/linux64
echo "Copying builds to incomingbuilds"
cp -r builds/* incomingbuilds/linux64/
ls -al incomingbuilds/linux64