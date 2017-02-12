#!/usr/bin/env bash

# Building LLDB under Mac OS X
# You first need a Codesign Certificate:
#   https://gist.github.com/thlorenz/a068c202f2487ec13809
# You don't need to re-create the Codesign Certificate while updating.

# 2015-01-15 https://gist.github.com/TheFox/028709d7c4d848bf444d


set -e

brew install swig

mkdir llvm
cd llvm

git clone http://llvm.org/git/llvm.git llvm-src
cd llvm-src

cd projects
git clone http://llvm.org/git/compiler-rt.git
cd ..

cd tools
git clone http://llvm.org/git/clang.git

git clone http://llvm.org/git/lldb.git
cd lldb
# First codesign: https://gist.github.com/thlorenz/a068c202f2487ec13809
xcodebuild -configuration Release
ln -s $(pwd)/build/Release/lldb /usr/local/bin/lldb
cd .. # lldb
cd .. # tools

#mkdir build
#cd ../build
#CC=gcc-4.9 CXX=g++-4.9 cmake -DLLVM_ENABLE_DOXYGEN=false ../llvm-src
#make
#make check

echo 'done'
