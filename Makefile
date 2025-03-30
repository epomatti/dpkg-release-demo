# Forcing it to build, as the directory has the same name
# https://stackoverflow.com/a/59558099/3231778
.PHONY: build deb-package

DEB_DIST_DIR := deb-package/deb
BINARY_BUILD := build/quotes
BINARY_DIST := "${DEB_DIST_DIR}/etc/quotes"

build:
		mkdir -p build
		go build -o "${BINARY_BUILD}"

up:
		go run .

deb-package:
		$(MAKE) clean-build clean-package-debian build		
		mkdir -p "${BINARY_DIST}"
		cp -r deb-package "${DEB_DIST_DIR}"
		cp "${BINARY_BUILD}" "${BINARY_DIST}/quotes"
		chmod -R 0555 dist/deb/DEBIAN
		dpkg-deb --build deb-package ${BINARY_BUILD}

clean-build:
		rm -rf build

clean-package-debian:
		rm -rf dist/debian
