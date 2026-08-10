#!/vendor/bin/sh

# A ROM called "BeyondROM" automatically updated
# the firmware to the latest One UI 8 release (except sboot.bin).
# User cannot flash the required (One UI 7) firmware anymore so
# we need to check the current firmware. We cannot use ro.bootloader
# due to the old sboot.bin but we can check in radio 
# if the user has the required firmware (ending with FYI3).
# If they don't then a prop will be set that we will use later 
# to mount the correct TEEgris folder.

RADIO=$(strings /dev/block/by-name/radio)

if echo "$RADIO" | grep -q FYI3; then
    setprop dev.teegris.model old
elif echo "$RADIO" | grep -q EYB1; then
    setprop dev.teegris.model eyb1
fi