# Copyright (C) 2012 The CyanogenMod Project
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

ifeq ($(TARGET_USES_QCOM_BSP), true)
# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
endif #TARGET_USES_QCOM_BSP

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/msm8974-common/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=false \
    av.offload.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
    persist.rild.nitz_plmn="" \
    persist.rild.nitz_long_ons_0="" \
    persist.rild.nitz_long_ons_1="" \
    persist.rild.nitz_long_ons_2="" \
    persist.rild.nitz_long_ons_3="" \
    persist.rild.nitz_short_ons_0="" \
    persist.rild.nitz_short_ons_1="" \
    persist.rild.nitz_short_ons_2="" \
    persist.rild.nitz_short_ons_3=""

PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# kernel test
PRODUCT_PACKAGE += \
   mm-audio-native-test

# Audio
PRODUCT_PACKAGES += \
    audiod \
    audio_policy.msm8974 \
    audio.a2dp.default \
    mm-audio-native-test \
    alsa.msm8974 \
    audio.primary.msm8974 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing \
    tinymix

# Display
PRODUCT_PACKAGES += \
    copybit.msm8974 \
    gralloc.msm8974 \
    hwcomposer.msm8974 \
    memtrack.msm8974 \
    libqdMetaData \
    liboverlay \
    libqdutils \
    libgenlock \
    libqservice

# Keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/msm8974-common/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    device/samsung/msm8974-common/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    device/samsung/msm8974-common/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml  \
    device/samsung/msm8974-common/configs/media_codecs.xml:system/etc/media_codecs.xml

# LIBOPENCOREHW
PRODUCT_PACKAGE += \
    libopencorehw

# qcom jar files
PRODUCT_PACKAGES += \
    libdashplayer \
    libqcmediaplayer \
    qcmediaplayer \
    libextmedia_jni \
    tcmiface \
    vcard \
    flatland

# MM_VIDEO
PRODUCT_PACKAGES += \
    ast-mm-vdec-omx-test \
    libavenhancements \
    liblasic \
    mm-vdec-omx-property-mgr \
    mm-vdec-omx-test \
    mm-venc-omx-test \
    mm-venc-omx-test720p \
    mm-video-driver-test \
    mm-video-encdrv-test

#MM_AUDIO
MM_AUDIO := libOmxAacDec
MM_AUDIO += libOmxAacEnc
MM_AUDIO += libOmxAmrEnc
MM_AUDIO += libOmxEvrcEnc
MM_AUDIO += libOmxMp3Dec
MM_AUDIO += libOmxQcelp13Enc
MM_AUDIO += libOmxAc3HwDec
PRODUCT_PACKAGES += $(MM_AUDIO)

#OPENCORE
OPENCORE := libomx_aacdec_sharedlibrary
OPENCORE += libomx_amrdec_sharedlibrary
OPENCORE += libomx_amrenc_sharedlibrary
OPENCORE += libomx_avcdec_sharedlibrary
OPENCORE += libomx_m4vdec_sharedlibrary
OPENCORE += libomx_mp3dec_sharedlibrary
OPENCORE += libomx_sharedlibrary
OPENCORE += libopencore_author
OPENCORE += libopencore_common
OPENCORE += libopencore_download
OPENCORE += libopencore_downloadreg
OPENCORE += libopencore_mp4local
OPENCORE += libopencore_mp4localreg
OPENCORE += libopencore_net_support
OPENCORE += libopencore_player
OPENCORE += libopencore_rtsp
OPENCORE += libopencore_rtspreg
OPENCORE += libpvdecoder_gsmamr
OPENCORE += libpvplayer_engine
OPENCORE += libpvamrwbdecoder
OPENCORE += libpvauthorengine
OPENCORE += libomx_amr_component_lib
OPENCORE += pvplayer
OPENCORE += pvplayer_engine_test
PRODUCT_PACKAGES += $(OPENCORE)

# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libI420colorconvert \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libOmxVidEnc \
    libI420colorconvert \
    libstagefrighthw

# qcom lib files
PRODUCT_PACKAGES += \
    libQcomUI

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8974

PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += qcmediaplayer

ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += WfdCommon
#PRODUCT_BOOT_JARS += security-bridge
#PRODUCT_BOOT_JARS += qsb-port
PRODUCT_BOOT_JARS += oem-services
PRODUCT_BOOT_JARS += com.qti.dpmframework
PRODUCT_BOOT_JARS += dpmapi
PRODUCT_BOOT_JARS += com.qti.location.sdk
endif

# skip boot jars check if QCPATH not available
SKIP_BOOT_JARS_CHECK := true

# common msm8974
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)
