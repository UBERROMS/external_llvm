LOCAL_PATH:= $(call my-dir)

bitcode_writer_SRC_FILES := \
	BitWriter.cpp	\
	BitcodeWriter.cpp	\
	BitcodeWriterPass.cpp	\
	ValueEnumerator.cpp

# For the host
# =====================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(bitcode_writer_SRC_FILES)

LOCAL_MODULE:= libLLVMBitWriter

LOCAL_MODULE_HOST_OS := darwin linux windows

include $(LLVM_HOST_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_HOST_STATIC_LIBRARY)

# For the device
# =====================================================
include $(CLEAR_VARS)
ifneq (true,$(DISABLE_LLVM_DEVICE_BUILDS))

LOCAL_SRC_FILES := $(bitcode_writer_SRC_FILES)

LOCAL_MODULE:= libLLVMBitWriter

include $(LLVM_DEVICE_BUILD_MK)
include $(LLVM_GEN_ATTRIBUTES_MK)
include $(LLVM_GEN_INTRINSICS_MK)
include $(BUILD_STATIC_LIBRARY)
endif
