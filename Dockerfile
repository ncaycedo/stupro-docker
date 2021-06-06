FROM nvidia/cudagl:11.3.0-runtime-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG TZ
ENV TZ=${TZ:-Europe/Berlin}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt upgrade -y && \
    apt install -y locales

RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8

RUN apt install -y curl gnupg2 lsb-release

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && \
    apt install -y ros-foxy-desktop
RUN /bin/bash -c "source /opt/ros/foxy/setup.bash"
RUN apt install -y python3-argcomplete

RUN curl -sSL http://get.gazebosim.org | sh

RUN apt install -y ros-foxy-gazebo-ros-pkgs

CMD ["/usr/bin/gazebo"]
