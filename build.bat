::cmake -G "Visual Studio 15" -H. -Bbuild
cmake -G "Visual Studio 15 Win64" -H. -Bbuild
cmake --build build --config Debug
pause