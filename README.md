# libBlocksRuntime Android Port #

This is a port of libBlocksRuntime to the Android NDK.

As of NDK-r8, Clang ships as an unsupported compiler.  Using the `-fblocks` compile flag and linking against this library fully enables Apple's blocks extension on Android.

## Compilation ##

Do not use configure or the Makefile; these are there in order to build for other supported platforms.

 1. Add `libblocksruntime` to your `LOCAL_STATIC_LIBRARIES`.
 2. Add the directory with `blocks.h` to your include list via `LOCAL_CFLAGS`
 3. Specify clang as the compiler of choice, either in `Application.mk` or from the command line when building.

    NDK_TOOLCHAIN_VERSION="clang3.1" ndk-build 
