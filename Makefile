# Forcing it to build, as the directory has the same name
# https://stackoverflow.com/a/59558099/3231778
.PHONY: build deb-package

DEBIAN_DIST := dist/deb-package

build:
		mkdir -p build
		go build -o build/quotes

up:
		go run .

deb-package:
		$(MAKE) clean-build clean-package-debian build
		mkdir -p "${DEBIAN_DIST}/etc/quotes"
		cp -r deb-package dist
		cp build/quotes "${DEBIAN_DIST}/etc/quotes"
		chmod -R 0755 "${DEBIAN_DIST}"
		dpkg-deb --build "${DEBIAN_DIST}" dist/quotes.deb

clean-build:
		rm -rf build

clean-package-debian:
		rm -rf dist
