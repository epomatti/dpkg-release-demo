# `dpkg` Release

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

Build the `.deb` executable:

```sh
dpkg-deb --build release dist/contoso.deb
```

Run and install the Debian release:

```sh
sudo dpkg -i contoso.deb
```
