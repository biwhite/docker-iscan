# Dockered iscan #

## Build ##

```
docker build -t biwhite/iscan .
```

## RUN ##

```
docker run --rm --name iscan -p 5900:5900 -e DISPLAY=:0 --device=/dev/bus/usb --device=/dev/usb/lp0 -e HOME=/root biwhite/iscan x11vnc -forever -usepw -create
```

Devices need passing through from /dev/ as needed.  The scanner should be connected prior to starting container, otherwise the devices do not exist in advance.

Connect to VNC, password is ```1234```

## TODO ##

- Resize X11 desktop or iscan window to be the same size
- Map a volume and set working directory to particular path to ease file saving
- Scan connectivity seems unreliable.  Unsure if this is a docker problem, or physical hardware issue on my test setup!
- Kill container or restart iscan, if iscan app is closed, otherwise left with empty vnc server

