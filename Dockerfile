FROM mkaag/baseimage:latest
MAINTAINER Maurice Kaag <mkaag@me.com>

# -----------------------------------------------------------------------------
# Environment variables
# -----------------------------------------------------------------------------
ENV JAVA_VERSION  7

# -----------------------------------------------------------------------------
# Pre-install
# -----------------------------------------------------------------------------
RUN \
  echo 'deb http://debian.yacy.net ./' > /etc/apt/sources.list.d/yacy.list && \
  wget http://debian.yacy.net/yacy_orbiter_key.asc -O- | apt-key add - && \
  apt-key advanced --keyserver pgp.net.nz --recv-keys 03D886E7 && \
  apt-get update -qqy

# -----------------------------------------------------------------------------
# Install
# -----------------------------------------------------------------------------
RUN \
  apt-get install -qqy \
    openjdk-${JAVA_VERSION}-jre-headless \
    yacy

# -----------------------------------------------------------------------------
# Post-install
# -----------------------------------------------------------------------------
RUN mkdir /etc/service/yacy
ADD build/yacy.sh /etc/service/yacy/run
RUN chmod +x /etc/service/yacy/run

EXPOSE 8090
VOLUME ["/var/lib/yacy", "/etc/yacy"]

CMD ["/sbin/my_init"]

# -----------------------------------------------------------------------------
# Clean up
# -----------------------------------------------------------------------------
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*