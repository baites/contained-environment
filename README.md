# CEnv Tools to manage contained environments

## Introduction

Contained environment is a collection of bash scripts to manage contained environments and their images using docker. The main goal is to produce environments similar to python's virtual environments using docker containers.

The main advantage of this approach is:

* Add an extra layer of isolation.
* Allow isolated environment to develop in any language.
* Install any dependency without contaminating the host environment.
* Functional testing in different Linux distros.

## Examples

* Build a minimal image for developing in Ubuntu latest

```bash
# download the code
$ git clone git@github.com:baites/contained-environment.git cenv
$ cd cenv
# add cenv/bin directory to path
$ export PATH="$PWD/bin:$PATH"
# build environment image
$ ienv-build dockerfiles/ubuntu.dockerfile
...
# verify if image was created correctly
$ ienv-list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ienv-ubuntu         latest              2128bf283893        2 minutes ago       348MB
$ cd {your workdir}
# Make a contained environment from image
$ cenv-make ienv-ubuntu
Create cenv-ubuntu-{wdir}-{user}.
Start cenv-ubuntu-{wdir}-{user}
Configure user {user}:{user primary group} in cenv-ubuntu-{wdir}-{user}
Stop enviroment cenv-ubuntu-{wdir}-{user}
# Enter in the environment
$ cenv-enter cenv-ubuntu-{wdir}-{user}
{user}@5d01eee391d6:~/{wdir}$ pwd
/home/baites/cenv
# Install package
{user}@5d01eee391d6:~/{wdir}$ sudo apt install libsystemd-dev
...
# SSH with your private keys
{user}@5d01eee391d6:~/{wdir}$ ssh -T git@bsegitlab
Welcome to GitLab, @{some user name}!
# Exit the environment
{user}@5d01eee391d6:~/{wdir}$ exit
```

* Stopping, deleting a container

```bash
$ cenv-list
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
5d01eee391d6        ienv-ubuntu         "/bin/bash"         17 minutes ago      Up 16 minutes                           cenv-ubuntu-{wdir}-{user}
$ cenv-stop cenv-ubuntu-{wdir}-{user}
$ cenv-rm cenv-ubuntu-{wdir}-{user}
```

* Destroy enviroment image

```bash
$ ienv-list
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ienv-ubuntu         latest              2128bf283893        26 minutes ago      348MB
$ ienv-rm ienv-ubuntu
```
