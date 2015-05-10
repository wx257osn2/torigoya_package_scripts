#!/bin/bash

#
Program="boost"
ProgramVersion="1.57.0"
Toolset="gcc"
ToolsetVersion="4.8.2"
ToolsetBjamOption='cxxflags="-std=c++11" linkflags="-L/usr/lib/x86_64-linux-gnu"'

# call
. ./cxx/boost/_build_boost.sh
