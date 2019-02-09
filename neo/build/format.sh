#!/bin/bash
echo "Formatting all the files..."

cd ..
astyle --options=.astylerc */*.h
astyle --options=.astylerc */*.cpp
rm -rf */*.orig

echo "OK!"