#!/bin/bash

# includes
. _import.sh

#
PackageVersion=`make_package_version $ProgramVersion`

# set workspace path
BuildWorkPath=`buildworkpath $Program`
cd $BuildWorkPath

if [ "$ProgramVersion" == "head" ]; then
    #
    svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
    cd libcxx
    SVNVersion=`get_svn_rev`
    cd ../

    RevedPackageVersion="$PackageVersion.$SVNVersion"
    echo "Version => $RevedPackageVersion"

    #
    IFS="?";read Cur Conf <<< "`make_build_dir libc-build`"
    cd $Cur

    InstallPrefix=$InstallPath/libc++.head

    #
    echo | g++ -Wp,-v -x c++ - -fsyntax-only

    # FIXME
    CC=clang CXX=clang++ \
        cmake -G "Unix Makefiles" \
        -DLIBCXX_CXX_ABI=libsupc++ \
        -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="/usr/include/c++/4.8;/usr/include/x86_64-linux-gnu/c++/4.8" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$InstallPrefix \
        ./../libcxx \
        && make_edge_deb_from_dir libc++ $RevedPackageVersion $Cur $InstallPrefix

else
    echo "Not supported"
    exit -1
fi
