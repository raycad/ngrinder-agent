# Download ubuntu base image 18.10
FROM ubuntu:18.10
LABEL Nguyen Truong Duong<seedotech@gmail.com>

WORKDIR /root

# Install dependencies and utils. NOTE NGrinder just works with openjdk-8-jdk and lower
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
  apt-get install -y openssh-server openjdk-8-jdk htop wget nano iputils-ping net-tools netcat

# Version
ENV NGRINDER_VERSION=3.4.2

# Set NGrinder Home
ENV NGRINDER_HOME=/usr/local/ngrinder-$NGRINDER_VERSION
ENV NGRINDER_AGENT_HOME=$NGRINDER_HOME/ngrinder-agent-$NGRINDER_VERSION
ENV NGRINDER_MONITOR_HOME=$NGRINDER_HOME/ngrinder-monitor-$NGRINDER_VERSION

ENV NGRINDER_CONTROLLER_IP=ngrinder-controller
ENV NGRINDER_CONTROLLER_PORT=16001

# If you want to monitor bind to the different local ip not automatically selected ip. Specify below field.
# ENV NGRINDER_MONITOR_BINDING_IP=localhost
# ENV NGRINDER_MONITOR_BINDING_PORT=13243

RUN mkdir -p $NGRINDER_AGENT_HOME
RUN mkdir -p $NGRINDER_MONITOR_HOME

# Install NGrinder Agent
ADD ngrinder-$NGRINDER_VERSION/ngrinder-agent-$NGRINDER_VERSION $NGRINDER_AGENT_HOME

# Install NGrinder Monitor
ADD ngrinder-$NGRINDER_VERSION/ngrinder-monitor-$NGRINDER_VERSION $NGRINDER_MONITOR_HOME

# Copy start script
ADD bootstrap/start_ngrinder_agent.sh /root/start_ngrinder_agent.sh

# # Ports NGRINDER Controller
# EXPOSE 8080
# # Ports NGRINDER Agent
# EXPOSE 16001
# # Ports NGRINDER Monitor
# EXPOSE 13243

# Set environment variables for other users
RUN echo "export NGRINDER_HOME=$NGRINDER_HOME" >> /etc/bash.bashrc
RUN echo "export PATH=$PATH:$NGRINDER_HOME" >> /etc/bash.bashrc

# Start services
CMD [ "sh", "-c", "service ssh start; /root/start_ngrinder_agent.sh; /bin/bash"]