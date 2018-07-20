# NuGet Server with Klondike for Docker

*Show your support for this project by signing up for a [free Bitrise account!](https://app.bitrise.io?referrer=02c20c56fa07adcb)*

Provides a clean and easy way to run your own public/private NuGet repository with [Klondike](https://github.com/themotleyfool/Klondike) as the frontend, all inside a Docker container.

This image is based on [docker-klondike](https://github.com/athieriot/docker-klondike), adding easier configuration, volume mounting and optional authentication.

---

## Basic Usage

Sample usage:
```
docker run -p 8080:80 -v /my/host/klondike/Settings.config:/app/Settings.config -v /my/host/klondike/data:/data --name nuget-klondike -d didstopia/nuget-klondike:latest
```

The first time this image runs, it will create a `Settings.config` file under the `/data` folder, which you can customize and restart to apply your changes.

You can additionally add authentication like this (remove `-c` if the file exists):
```
docker exec nuget-klondike htpasswd -b -c /data/klondike_users user password
```

To disable authentication, simply delete `/data/klondike_users`. Enabling and disabling authentication happens automatically, so you don't need to restart your container.

**NOTE:** If you enable authentication, everything is protected except for `GET/HEAD` requests to `/api/packages/*`, for obvious reasons.

---

## Licenses

This project is provided under the [MIT License](https://github.com/Didstopia/docker-klondike/blob/master/LICENSE).
