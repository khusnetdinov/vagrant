![img](http://res.cloudinary.com/dtoqqxqjv/image/upload/c_scale,w_1000/v1489323685/github/VagrantVBAnsible.png)

# Vagrant box for development isolation services with long term data life cycle.
Vagrant environment and services sandbox for development application. Possible to set partial isolation or full
> Vagrant box is build for fast up and running development environment with Ubuntu, Postgres, Redis, ElasticSearch tools as default tools. Build on [Oracle Virtual Box](https://www.virtualbox.org/), [Vagrant HashiCorp](https://www.vagrantup.com/), [Ansible](https://www.ansible.com/) and [provisioner](https://github.com/khusnetdinov/provisioner/).

## Getting started

### Files structure
```
├── /.vagrant/                  # The source code
│   ├── /machines/              # Vagrant internal folder 
│   ├── /provisioners/          # Vagrant internal folder 
│   └── /provisioner/           # Main provision folder
│       ├── /temp/              # Ansible logs
│       │   └── .keep           # Git keep file
│       ├── /roles/             # Ansible roles / receipts from ansible-galaxy
│       │   ├── ....            # Roles 
│       │   └── .keep           # Git keep file
│       ├── ansible.cfg         # Ansible local config
│       ├── provision.yml       # Ansible playbook linked from VagrantFile
│       ├── requirements.yml    # Ansible receipts for downloading from ansible-galaxy
│       └── settings.yml        # Variables are used in provision.yml and other roles
│
│── Makefile                    # Makefile for installation Ansible receipts
│── VagrantFile                 # Vagrant configuration file
│── README.md                   # README
│── LICENSE                     # License
└── .gitignore                  # Git ignored files
```

### Commands

 `make install` - Run installation for ansidle requirements.yml

 `vagrant ...`  - Vagrant commands for up and run box

## Requirements

You need to install [Oracle Virtual Box](https://www.virtualbox.org/), [Vagrant HashiCorp](https://www.vagrantup.com/);

Optinal: run `vagrant plugin install vagrant-triggers` . Plugin will be installed on first run `vagrant up` or `vagrant provision`

## Installation

### MacOs

`brew cask install virtualbox`

`brew cask install vagrant`

`vagrant plugin install vagrant-triggers`

### Ubuntu

`sudo apt-get install virtualbox`

`sudo apt-get install vagrant`

`vagrant plugin install vagrant-triggers`

## TODO
  - Copy SSH keys ot guest machine
  - Partial isolation with private network

# License

### This code is free to use under the terms of the MIT license.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
