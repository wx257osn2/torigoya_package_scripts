#!/bin/bash

#
Program="boost"
ProgramVersion="head"
Toolset="gcc"
ToolsetVersion="4.8.3"
ToolsetBjamOption='cxxflags="-std=c++11" linkflags="-L/usr/lib/x86_64-linux-gnu"'

# call
. ./cxx/boost/_build_boost.sh
