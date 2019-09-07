# Guide to creating a producer node on the REMChain testnet

# **Installation Steps**

__Step 1:__

```sudo wget https://github.com/SooSDExZ/Installation-Scripts/raw/master/Install-1.sh && sudo chmod u+x Install-1.sh && sudo ./Install-1.sh```

* **Update and upgrade**
* **Set new root password**
* **Change SSH port number**
* **Disable SSH root access**
* **Setup new user account**
* **Protect SSH with Fail2Ban**
* **Setup a firewall with UFW**

__Step 2:__

```sudo wget https://github.com/SooSDExZ/Installation-Scripts/raw/master/Install-2.sh && sudo wget https://github.com/SooSDExZ/Installation-Scripts/raw/master/Install-3.sh && sudo chmod u+x Install-2.sh && sudo chmod u+x Install-3.sh && sudo ./Install-2.sh```

* **Download and install remnode binaries**
* **Download and install the genesis file**
* **Create and adjust the config.ini file**
* **Install canonical livepatch service**
* **First run of the remnode**

> Wait for the two dates shown on each block to be in sync with one another before proceeding onto the next step. It can usually take up to an hour for your node to be in sync with the REMME blockchain. Once it has synchronised you can exit back to the command line by pressing control + c.

__Step 3:__

```sudo ./Install-3.sh```

* **Run remnode in the background**
* **Create a new remnode wallet account**
* **Create 3 new keys, active, request and producer keys**
* **Import your owner, active, request and producer keys**
* **Input your new active, request and producer public keys**
* **Input your account name, producer private key and domain**
* **Setup key permissions for better security, request and producer keys**
* **Request key will be used for claiming, voting, transfering and restaking**
* **Producer key will be used for signing blocks as a block producer on the network**

# Additional Steps

__Step 1:__

**Setup canonical livepatch service**

This will enable you to apply critical kernel security fixes to your ubuntu server automatically without the need of rebooting the server. Therefore this livepatch will reduce downtime while maintaining compliance and security.

`https://auth.livepatch.canonical.com/`

> Visit the site, register an account and generate your credentials. Via the canonical livepatch portal.

`sudo canonical-livepatch enable YOURLIVEPATCHKEY`

> Enable the canonical livepatch on your ubuntu server.

`canonical-livepatch status —verbose`

> This will allow you to check your live patch status, fixes, uptime, boot time and last check time. 
