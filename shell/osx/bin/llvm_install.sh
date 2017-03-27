#!/usr/bin/env bash

# Building LLDB under Mac OS X
# You first need a Codesign Certificate:
#   https://gist.github.com/thlorenz/a068c202f2487ec13809
# You don't need to re-create the Codesign Certificate while updating.

# 2015-01-15 https://gist.github.com/TheFox/028709d7c4d848bf444d
# 2017-02-12 https://github.com/TheFox/dotfiles/blob/4163fe23422fd5ac0d472d6d53969422f20cf1b9/shell/osx/bin/llvm_install.sh

set -e

brew install swig

mkdir llvm
pushd llvm

git clone http://llvm.org/git/llvm.git llvm-src
pushd llvm-src

pushd projects
git clone http://llvm.org/git/compiler-rt.git
popd

pushd tools
git clone http://llvm.org/git/clang.git

git clone http://llvm.org/git/lldb.git
pushd lldb
# First codesign: https://gist.github.com/thlorenz/a068c202f2487ec13809
xcodebuild -configuration Release
ln -s "$PWD/build/Release/lldb" /usr/local/bin/lldb
popd # lldb

popd # tools

#mkdir build
#cd ../build
#CC=gcc-4.9 CXX=g++-4.9 cmake -DLLVM_ENABLE_DOXYGEN=false ../llvm-src
#make
#make check

echo 'done'
