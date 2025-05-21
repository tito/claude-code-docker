# Claude Code Docker Image

This image is only useful when you use claude code on Windows.

## Building & Push Docker Image

First copy the `.env-template` to `.env` and edit with your info.

You can setup the image name and remote docker registry where to push.

To build execute:
```bash
./docker-build.sh
```

To push execute:
```bash
./docker-push-public.sh
```
