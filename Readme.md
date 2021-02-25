# Base Image for E-Commerce

## Support Ubuntu version

* 18.04
* 20.04

## Accounts 

* Disable root account login 
* Lock account after 3 failed attempts (https://linux-audit.com/locking-users-after-failed-login-attempts-with-pam_tally2/)

## Only the following specific ports should be listening
* 22 on 0.0.0.0
* 53 on 127.0.1

## Check if required packages are installed

* zfs
* az-cli
* Auditd

## Security 

* No Security pending patches (apt list --upgradable | grep "\-security")
* unattended security update package is not installed