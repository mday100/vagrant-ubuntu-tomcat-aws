Ubuntu Development and AWS Production Environment
====================

Apache Tomcat Server 8.0.32 running on Ubuntu 14.04.4 LTS (Trusty Tahr)


Installation
------------

Make sure you have [Virtual Box](https://www.virtualbox.org/wiki/Downloads) installed on your machine.

Install [Vagrant](https://www.vagrantup.com/downloads.html) to setup and configure the Development Environment.

Download a zip of this repository and unpack the contents.

Edit the Vagrantfile with your AWS credentials for production.

Enter that folder in the command line and type in:

    vagrant up dev     # for the development evnvironment
    vagrant up prod    # for the production environment

AWS Settings
------------

* Setup the default Security Group with SSH access on port 22.
* Create a Key Pair and know the location of the pem file.
* Enter in the correct Security Credentials for access.

Windows Pain Points
------------

* Ensure the latest version of Virtual Box is installed.
* Vagrant 1.8.1 had dependency issues. Downgrade to 1.7.4.
* Use PuTTygen to convert the pem files into ppk.
* Ensure the clock on your computer is up to date.
