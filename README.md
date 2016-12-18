# About this repo

This is source code for building an ubuntu image with go1.5.2 installed
on aarch64 platform.

## how to make go-linux-arm64-bootstrap.tbz

We have `go-linux-arm64-bootstrap.tbz` in Dockerfile but it's not in the
repo. You can make it yourself by doing the following steps on **x86_64**
platform:

```bash
# curl https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz | tar -v -C /tmp/old-go -xz --strip-components=1
# mkdir ~/go
# curl -k https://storage.googleapis.com/golang/go1.5.2.src.tar.gz | tar -v -C ~/go -xz --strip-components=1
# cd ~/go/src
# GOOS=linux GOROOT_BOOTSTRAP=/tmp/old-go GOARCH=arm64 ./bootstrap.bash
```

Then `go-linux-arm64-bootstrap.tbz` will be generated in `~/.`, you can
copy it to **aarch64** platform, and make the `Dockerfile` works.

> **Note:**
> You can get more information about go installation from [here](https://golang.org/doc/install/source).
