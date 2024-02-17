# NoANEEmojiSticker

A simple iOS tweak to fix/port drag-and-drop emoji sticker functionality to A10/A10X devices running iOS 17.

## Compatible Devices (Final)

- iPad 6th generation (A10)
- iPad 7th generation (A10)
- iPad Pro 10.5" (A10X)
- iPad Pro 12.9" 2nd generation (A10X)

## How? Why?

This drag-and-drop emoji feature is intended to be used on the devices that support Apple Neural Engine (ANE), meaning A11 and newer devices. By default, the emoji images are 160x160 pixels (you can try to export the emoji images from `AppleColorEmoji` font and look at the largest set of the images). Since Apple think this is not big enough for a _sticker_, they therefore utilize ANE to upscale the emoji to 320x320 pixels via machine learning.

Apple seems to forget that A10 and A10X devices do not have ANE, so the process to upscale the emoji will fail and the sticker will not be created. You can try this on your device and see that you won't be able to drop emoji sticker anywhere successfully. Fortunately, we can skip the ANE process and use the original big-enough 160x160 emoji image to create the sticker.
