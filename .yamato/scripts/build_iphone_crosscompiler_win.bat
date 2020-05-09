@echo off
git submodule update --init --recursive

set UNITY_THISISABUILDMACHINE=1
echo "Check if UNITY_THISISABUILDMACHINE is set"
echo %UNITY_THISISABUILDMACHINE%

C:/Cygwin64/bin/bash.exe external/buildscripts/build_ios_xwin.sh
if NOT %errorlevel% == 0 (
 echo "mono build script failed"
 EXIT /B %errorlevel%
)
echo "mono build script ran successfully"

md incomingbuilds\ios_xwin
xcopy /s /e /h /y builds\* incomingbuilds\ios_xwin
