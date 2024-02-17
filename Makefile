TARGET := iphone:clang:latest:17.0
ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoANEEmojiSticker

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
