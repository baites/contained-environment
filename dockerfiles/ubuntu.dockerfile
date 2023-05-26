# Ubuntu ienv dockerfile template

# Base image
from Ubuntu

# Set the environment
arg DEBIAN_FRONTEND=noninteractive

# Install dependencies
run apt-get update
run apt-get -y install git sudo ssh vim

# Update time zone for tzdata
run ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
run dpkg-reconfigure --frontend noninteractive tzdata
