docker-hugo
===========

[![](https://images.microbadger.com/badges/image/solidnerd/hugo.svg)](http://microbadger.com/images/solidnerd/hugo "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/solidnerd/hugo.svg)](https://microbadger.com/images/solidnerd/hugo "Get your own commit badge on microbadger.com")

[Hugo](https://gohugo.io) in a docker container


# How to use this Image

## Building a Site

```bash
docker run -it --rm -v $(pwd):/hugo solidnerd/hugo
```
## Develop your Website

```bash
docker run -it --rm -v $(pwd):/hugo -p 1313:1313 solidnerd/hugo hugo server --bind 0.0.0.0
```

# Build image

```bash
 docker build --build-arg HUGO_VERSION=$(cat VERSION) -t "solidnerd/hugo:$(cat VERSION)" .
```

## Build Parameters

Here are all possible hugo build args listed.

| ARG | Description |
|-----------|-------------|
| `HUGO_VERSION` | Sets the used hugo version during the build. Defaults to `0.18` |
| `HUGO_DOWNLOAD_URL` | Sets the hugo download url during the build. Defaults to `https://github.com/gohugio/hugo/releases/download/v$HUGO_VERSION/hugo_"$HUGO_VERSION"_Linux-64bit.tar.gz"`  |
| `HUGO_DOWNLOAD_FILE_NAME` | Sets the hugo filename during the build. Defaults to `hugo.tar.gz` |

## Issues

If you have any issues feel free to create an [issue on GitHub](https://github.com/solidnerd/docker-hugo/issues)
