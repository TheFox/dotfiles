#!/usr/bin/env bash

# 2015-01-15 https://gist.github.com/TheFox/028709d7c4d848bf444d
# 2017-02-12 https://github.com/TheFox/dotfiles/blob/4163fe23422fd5ac0d472d6d53969422f20cf1b9/shell/osx/bin/llvm_update.sh

set -e

cd llvm

cd llvm-src
git pull

cd projects
cd compiler-rt
git pull
cd .. # compiler-rt
cd .. # projects

cd tools
cd clang && git pull && cd ..

cd lldb
git pull
rm -rf build llvm llvm-build lldb.xcworkspace/xcshareddata
xcodebuild -configuration Release

echo 'done'
