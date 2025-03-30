# Forcing it to build, as the directory has the same name
# https://stackoverflow.com/a/59558099/3231778
.PHONY: build deb-package

# BINARY_BUILD := build/quotes
# SRC_DEB_PACKAGE := deb-package
# DIST_DEBIAN_DIR := dist
# DIST_DEBIAN_BINARY := "${DIST_DEBIAN_DIR}/etc/quotes"

build:
		mkdir -p build
		go build -o build/quotes

up:
		go run .

deb-package:
		$(MAKE) clean-build clean-package-debian build
		mkdir -p dist/deb-package/etc/quotes
		cp -r deb-package dist
		cp build/quotes dist/deb-package/etc/quotes
		chmod -R 0755 dist/deb-package
		dpkg-deb --build dist/deb-package dist/quotes

clean-build:
		rm -rf build

clean-package-debian:
		rm -rf dist
