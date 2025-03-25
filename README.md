# Debian Executable Sample

## Manual Build

Copy the dynamic configuration file:

```sh
cp templates/install.conf release/etc/contoso/install.conf
```

If required, change the permissions if necessary:

```sh
sudo chown -R root:root release/*
```

Bake any custom properties in the build, preferably through a CI/CD pipeline. Add encryption if necessary. Using a key pair generated on the remote could be an ideal option for security.

Build the `.deb` executable:

```sh
dpkg-deb --build release dist/contoso.deb
```

Copy the file generate to the remote destination.

Run and install the Debian release:

```sh
sudo dpkg -i contoso.deb
```
