#!/bin/bash

set -e

# move patches to expected dirs
mv "/home/moxi/patches/rom_patches/Axion/0001-made-for-axionasop-mk-files-and-fixed-overlay.patch" "/home/moxi/my-roms/axion/device/samsung/a53x/"
mv "/home/moxi/patches/rom_patches/Axion/0002-modified-genfs_contexts-to-work-with-axionAOSP.patch" "/home/moxi/my-roms/axion/device/samsung/s5e8825-common/sepolicy/vendor/"

cd "/home/moxi/my-roms/axion/device/samsung/a53x/"

if [ -d ".git/rebase-apply" ]; then
    echo "abort"
    git am --abort
fi

echo "apply 0001-made-for-axionasop-mk-files-and-fixed-overlay.patch | patch"
git am 0001-made-for-axionasop-mk-files-and-fixed-overlay.patch

sleep 1

cd "/home/moxi/my-roms/axion/device/samsung/s5e8825-common/sepolicy/vendor"

if [ -d ".git/rebase-apply" ]; then
    echo "abort"
    git am --abort
fi

echo "apply 0002-modified-genfs_contexts-to-work-with-axionAOSP.patch | patch"
git am 0002-modified-genfs_contexts-to-work-with-axionAOSP.patch

sleep 1
echo "deleting applied patches..."

echo "removing ~/my-roms/axion/device/samsung/a53x/0001-made-for-axionasop-mk-files-and-fixed-overlay.patch"
rm -rf ~/my-roms/axion/device/samsung/a53x/0001-made-for-axionasop-mk-files-and-fixed-overlay.patch

sleep 1

echo "removing ~/my-roms/axion/device/samsung/s5e8825-common/sepolicy/vendor/0002-modified-genfs_contexts-to-work-with-axionAOSP.patch"
rm -rf ~/my-roms/axion/device/samsung/s5e8825-common/sepolicy/vendor/0002-modified-genfs_contexts-to-work-with-axionAOSP.patch
