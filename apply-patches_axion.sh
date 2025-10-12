#!/bin/bash
set -e

CHECK_FAIL(){ [[ -d ".git/rebase-apply" ]] && git am --abort; }

PATCH_DIR="$(pwd)/rom_patches"
DT_DIR="$1"

if [[ -z "$1" ]]; then
    echo "Usage: [dt_dirs]"
    exit 1
fi

A53X_PATCHES=( "0001-made-for-axionasop-mk-files-and-fixed-overlay" )
S5E8825_PATCHES=( "0002-modified-genfs_contexts-to-work-with-axionAOSP" )

(
cd "$1/a53x"

CHECK_FAIL

for i in "${A53X_PATCHES[@]}"; do
    git am --rej "$PATCH_DIR/$i.patch"
done
)

(
cd "$1/s5e8825-common"

CHECK_FAIL

for i in "${S5E8825_PATCHES[@]}"; do
    git am --rej "$PATCH_DIR/$i.patch"
done
)
