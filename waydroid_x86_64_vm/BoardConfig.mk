#
# Copyright (C) 2021 The Waydroid Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

-include device/waydroid/waydroid/BoardConfig.mk
include device/waydroid/waydroid/waydroid_x86_64_vm/x86_64-kernel.mk

# Architecture
TARGET_CPU_ABI := x86_64
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64

TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86_64

# ifneq ($(TARGET_USE_MESA),false)
# BOARD_MESA3D_GALLIUM_DRIVERS += radeonsi i915 iris crocus
# BOARD_MESA3D_VULKAN_DRIVERS += amd intel
# endif

BOARD_USERDATAIMAGE_PARTITION_SIZE := 1153433600
BOARD_USES_METADATA_PARTITION := false
BOARD_AVB_ENABLE := false

# TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2d000000400 | 0x2c00000000 | 0x500000000 | 0xa00000000 | 0x100000000 | 0x10000000000