# Ubuntu ienv dockerfile template

# Base image
FROM Ubuntu

# Set the environment
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update
RUN apt-get -y install git sudo ssh vim

# Update time zone for tzdata
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
