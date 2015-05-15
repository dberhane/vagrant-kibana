# BMJ Drupal site 

## Description

Vagrant and Puppet provisioner script which deploys a Drupal local development environment based on an Ubuntu VM

## Requirements

### Platform:
Tested on Ubuntu 10.04

### Installation 

(The Puppet script was tested on Virtualbox 4.3.18 and Vagrant 1.6.5)

- Install Virtualbox 4.3.18 

- Install Vagrant 1.6.5 

- Install Vagrant hostsupdater to add update windows hosts file (vagrant plugin install vagrant-hostsupdater)

It is recommend that you use the new Vagrant rsync feature to sync and share folders between hosts and guest VM to get a better performance of your VM.

## Usage

Download or clone this git repo and change to the directory and run

- Review Vagrant file settings

- Run vagrant up

=======
drupal-sites
=========

Puppet script for The BMJ local Drupal development environment

Author:: Daniel Berhane (<dberhane@gmail.com>)