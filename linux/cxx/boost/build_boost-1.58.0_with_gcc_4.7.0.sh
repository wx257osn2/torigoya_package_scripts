#!/bin/bash

#
Program="boost"
ProgramVersion="1.58.0"
Toolset="gcc"
ToolsetVersion="4.7.0"
ToolsetBjamOption='cxxflags="-std=c++11" linkflags="-L/usr/lib/x86_64-linux-gnu"'

# call
. ./cxx/boost/_build_boost.sh
