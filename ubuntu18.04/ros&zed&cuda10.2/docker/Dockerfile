# syntax = docker/dockerfile:experimental
FROM stereolabs/zed:3.4-ros-devel-cuda10.2-ubuntu18.04

# Arguments
ARG USER=initial
ARG GROUP=initial
ARG UID=1000
ARG GID=${UID}
ARG SHELL=/bin/bash

# Env vars for the nvidia-container-runtime.
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

# Setup users and groups
RUN groupadd --gid ${GID} ${GROUP} \
  && useradd --gid ${GID} --uid ${UID} -ms ${SHELL} ${USER} \
  && mkdir -p /etc/sudoers.d \
  && echo "${USER}:x:${UID}:${UID}:${USER},,,:$HOME:${shell}" >> /etc/passwd \
  && echo "${USER}:x:${UID}:" >> /etc/group \
  && echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" \
  && chmod 0440 "/etc/sudoers.d/${USER}"
# Replace apt urls
RUN sed -i 's@archive.ubuntu.com@ftp.tku.edu.tw/@g' /etc/apt/sources.list

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  sudo net-tools htop git rsync wget zip unzip \
  byobu zsh \
  nano vim \
  terminator gnome-terminal libcanberra-gtk3-module \
  dbus-x11 libglvnd0 libgl1 libglx0 libegl1 libxext6 libx11-6 \
  python-pip python-setuptools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN chown -R ${USER}:${GROUP} /usr/local/zed

WORKDIR /home/${USER}/.tmp

# setup custom configuration
COPY config .
# shell
RUN bash ./script/bash_setup.bash \
  && bash ./script/terminator_setup.bash \
  && bash ./script/zsh_setup.bash \
  && bash ./script/byobu_setup.bash \
  # Dependent
  && bash ./script/zed_setup.bssh \
  # && bash ./script/pip_setup.bash \
  && sudo rm -rf /home/${USER}/.tmp

# RUN pigpiod
WORKDIR /home/${USER}

# Switch user to ${USER}
USER ${USER}

RUN sudo mkdir work

# Make SSH available
EXPOSE 22

# Switch to user's HOME folder
WORKDIR /home/${USER}/work

# ENTRYPOINT ["/entrypoint.bash","byobu"]
# ENTRYPOINT ["byobu"]
# ENTRYPOINT ["bash"]
ENTRYPOINT ["terminator"]
# ENTRYPOINT ["zsh"]
