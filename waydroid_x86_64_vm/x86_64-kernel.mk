# PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

TARGET_KERNEL_USE ?= 5.15

PRODUCT_COPY_FILES += \
    kernel/prebuilts/$(TARGET_KERNEL_USE)/x86_64/kernel-$(TARGET_KERNEL_USE):kernel-waydroid \


BOARD_USES_RECOVERY_AS_BOOT :=
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

BOARD_BOOT_HEADER_VERSION := 4 
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

KERNEL_MODULES_PATH := kernel/prebuilts/common-modules/virtual-device/$(TARGET_KERNEL_USE)/x86-64

BOARD_VENDOR_RAMDISK_KERNEL_MODULES += \
     $(filter-out $(KERNEL_MODULES_EXCLUDE), $(wildcard $(KERNEL_MODULES_PATH)/*.ko))

# # BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := \
# #         $(filter $(KERNEL_MODULES_EXCLUDE),$(KERNEL_MODULES_LOAD))

WAYDROID_KERNEL_FILE := kernel/prebuilts/$(TARGET_KERNEL_USE)/x86_64/kernel-$(TARGET_KERNEL_USE)

PRODUCT_COPY_FILES += \
    $(WAYDROID_KERNEL_FILE):kernel-waydroid \
    device/waydroid/waydroid/waydroid_x86_64_vm/fstab.waydroid:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.waydroid \
    device/waydroid/waydroid/waydroid_x86_64_vm/fstab.waydroid:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/fstab.waydroid \
    device/waydroid/waydroid/waydroid_x86_64_vm/fstab.waydroid:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.waydroid


$(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/vendor_boot.img: $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/combined_ramdisk.img


$(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/combined_ramdisk.img:  $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/vendor_ramdisk.img  $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/ramdisk.img 
	cat $^ > $@
