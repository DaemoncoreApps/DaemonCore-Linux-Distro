#!/bin/sh
set -eu

PROJECT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BUILD_DIR="$PROJECT_DIR/.build"

if [ "$(id -u)" -ne 0 ]; then
    echo "Run this cleanup with sudo: sudo ./clean.sh" >&2
    exit 1
fi

if [ -d "$BUILD_DIR" ]; then
    cd "$BUILD_DIR"
    if command -v lb >/dev/null 2>&1; then
        lb clean --purge
    fi
    find "$BUILD_DIR" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} +
fi

echo "Removed generated files from $BUILD_DIR"

