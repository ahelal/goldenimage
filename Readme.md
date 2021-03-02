# Base Image

## Warning 

The default image is used by test-kitchen is intentially old and has some security issues.

## Image Requirments

**Support Ubuntu version**
- Only support ubuntu
- 18.04
- 20.04

**Accounts**
- Disable root account login 

**Image file version exists with content**
- /var/goldenimage_version.txt exists
- with the following content
```
version: GITHASH
date: TIMESTAMP
```

**Check if required packages are installed**
- azure-cli
- auditd

**Security**
- No Security pending patches `apt list --upgradable | grep "\-security"`
- unattended security update package is not installed

**Only the following specific ports should be listenin**
- 22 on 0.0.0.0
- 53 on 127.0.1

## Tools under the hood

- *test-kitchen* is an integration tool for developing and testing infrastructure code and software on isolated target platforms. https://kitchen.ci/
- *inspec* a testing framework for infrastructure with a human- and machine-readable language for specifying compliance, security and policy requirements. https://community.chef.io/tools/chef-inspec/
- *Ansible* a simple, agentless IT automation tool https://www.ansible.com/
- *Packer* automates the creation of any type of machine image https://www.packer.io/

## Dev Environment

This environment was test on Ubuntu 18.04 it should work with other versions of ubuntu. It can work also on OSX but you need to find equvilent packages in brew check `bin/setup.sh`

``` bash
# setup dev enviornment install all requirments
./bin/gold.sh setup

# source Azrue environment variables 
#  You need to copy creds-example to `creds` and fill in the SPN details
source config/base_image_config
source config/creds

# Managing our test vm environment 
./bin/gold.sh create    # Create the VM in azure
./bin/gold.sh destroy   # Destroy the VM in azure
./bin/gold.sh converage # Run our provisioning code (Ansible)
./bin/gold.sh verify    # Run our test code (inspec)
```

## Building an image in Azure

```bash
# source Azrue environment variables 
source config/base_image_config
source config/creds

# Check config/base_image_config to config image base, versions, ...

./bin/gold.sh image-build
```
