FROM debian:jessie
MAINTAINER Ben White <ben@cuckoo.org>
# iscan comes from http://support.epson.net/linux/en/iscan_c.html
# Set correct environment variables.
ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends && \
    echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends && \
    apt-get update -q && \
    apt-get install -y x11vnc xvfb
ADD https://download2.ebz.epson.net/iscan/general/deb/x64/iscan-bundle-1.0.0.x64.deb.tar.gz /tmp/
RUN cd /tmp && tar -zxf iscan-bundle-1.0.0.x64.deb.tar.gz && cd iscan-bundle-1.0.0.x64.deb && ./install.sh
RUN mkdir ~/.vnc && x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN apt-get install -y sane-utils
RUN bash -c 'echo "iscan" >> ~/.xinitrc' && chmod +x ~/.xinitrc


