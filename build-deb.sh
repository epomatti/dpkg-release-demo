#!/bin/bash

PKG_NAME="contoso-agent"
VERSION="1.0"
ARCH="all"
OUTPUT_FILE="${PKG_NAME}_${VERSION}_${ARCH}.deb"

# Ensure correct permissions
chmod -R 755 my-script/usr/local/bin/

# Build the .deb package with a custom name
dpkg-deb --build my-script "$OUTPUT_FILE"

echo "Package built: $OUTPUT_FILE"
