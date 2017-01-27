# Dockered iscan #

## Build ##

```
docker build -t biwhite/iscan .
```

## RUN ##

```
docker run --rm --name iscan -p 5900:5900 -e DISPLAY=:0 --device=/dev/bus/usb --device=/dev/usb/lp0 -e HOME=/root biwhite/iscan x11vnc :0 -forever -usepw -create
```
Currently, it needs the printer to appear on /dev/usb/lp0 and be connected at container startup (or at least when iscan starts)

## TODO ##

- Resize X11 desktop or iscan window to be the same size
- Map a volume and set working directory to particular path to ease file saving
- Work out how to fire up the application when someone connects to VNC
- Sometimes scans fail midway, need to work out why/how to fix
