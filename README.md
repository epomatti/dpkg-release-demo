# `dpkg` Release

Quotes app with a `dpkg` release. To make a new Debian package:

```sh
make deb-package
```

Installation command:

```sh
sudo dpkg -i dist/quotes.deb
```

Get quotes:

```sh
sudo /etc/quotes/quotes
```
