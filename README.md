# `dpkg` Release

This is a simple functional template to release programs with `dpkg`.

## Manual Build

Copy the template configuration file:

```sh
cp templates/install.conf release/etc/contoso/install.conf
```

If required, change the permissions according to requirements:

> [!TIP]
> CI/CD will change permissions. Make sure permissions are set during installation

```sh
sudo chown -R root:root release/*
```

Write the output to a separate directory:

```sh
mkdir -p dist
```

Build the `.deb` executable:

```sh
dpkg-deb --build release dist/contoso.deb
```

Run and install the Debian release:

```sh
sudo dpkg -i contoso.deb
```
