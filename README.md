# Build

```
docker build -t rcmorano/hnsd .
```

# Run

* You may want to disable systemd-resolvd:
```
sudo systemctl disable systemd-resolved.service
sudo systemctl stop systemd-resolved
```
* Then run hnsd and bind port 53 it to localhost:
```
docker run -it --rm rcmorano/hnsd ---help
docker run -d \
  --name hnsd-resolver
  --restart unless-stopped \
  -p 53:53 \
  rcmorano/hnsd \
    -r 0.0.0.0:53
```

## Use baids for convenience

* Install [baids]
* Install project baids:
```
git clone https://github.com/rcmorano/docker-hnsd.git ~/.baids/functions.d/docker-hnsd
baids-reload
```
* Start/Stop/Destroy:
```
hnsd-start
hnsd-stop
hnsd-destroy
```

[baids]: https://github.com/rcmorano/baids
