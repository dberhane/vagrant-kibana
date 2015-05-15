# Vagrant box for ELK stack

## Description

Vagrant and Puppet provisioner script ELK stack: ElasticSearch, LogStash and Kibana 4

## Requirements

### Platform:
Tested on Trusty, Ubuntu 14.04

### Installation 

(The Puppet script was tested on Virtualbox 4.3.18 and Vagrant 1.6.5)

- Install Virtualbox 4.3.20 

- Install Vagrant 1.6.5 

- Install Vagrant hostsupdater to add update windows hosts file (vagrant plugin install vagrant-hostsupdater)

It is recommend that you use the new Vagrant rsync feature to sync and share folders between hosts and guest VM to get a better performance of your VM.

## Usage

Download or clone this git repo and change to the directory and run

- Review Vagrant file settings

- Run vagrant up


Author:: Daniel Berhane (<dberhane@gmail.com>)