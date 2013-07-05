# This library requires clang to build on Android.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libblocksruntime

LOCAL_SRC_FILES := runtime.c data.c

LOCAL_CFLAGS := -DHAVE_CONFIG_H -I. -DBlocksRuntime_EXPORTS -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_INT -DHAVE_SYNC_BOOL_COMPARE_AND_SWAP_LONG -std=c99 -Wall -Wextra -W -pedantic -Wno-unused-parameter -fPIC -DPIC -nostdlibinc

include $(BUILD_STATIC_LIBRARY)
