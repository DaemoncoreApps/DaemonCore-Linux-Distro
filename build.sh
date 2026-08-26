#!/bin/sh
set -eu

PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BUILD_DIR="$PROJECT_DIR/.build"
DIST_DIR="$PROJECT_DIR/dist"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run this build with sudo: sudo ./build.sh" >&2
    exit 1
fi

for command in lb debootstrap xorriso mksquashfs; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Missing required command: $command" >&2
        exit 1
    fi
done

mkdir -p "$BUILD_DIR" "$DIST_DIR"
rm -f "$DIST_DIR/daemoncore-amd64.iso" "$DIST_DIR/daemoncore-amd64.iso.sha256"

cp -a "$PROJECT_DIR/auto" "$PROJECT_DIR/config" "$BUILD_DIR/"
cd "$BUILD_DIR"

# Preserve usability when the project was unpacked on a filesystem that does
# not retain Unix executable bits (for example, a Windows-hosted worktree).
chmod +x auto/* config/hooks/live/*.hook.chroot

lb config
lb build 2>&1 | tee build.log

ISO_PATH=$(find . -maxdepth 1 -type f -name 'live-image-*.hybrid.iso' -print -quit)
if [ -z "$ISO_PATH" ]; then
    echo "Build completed without producing a hybrid ISO." >&2
    exit 1
fi

cp "$ISO_PATH" "$DIST_DIR/daemoncore-amd64.iso"
cd "$DIST_DIR"
sha256sum daemoncore-amd64.iso > daemoncore-amd64.iso.sha256

echo "Created $DIST_DIR/daemoncore-amd64.iso"
