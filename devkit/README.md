# Dev Kit

This is a series of scripts to set up a dev machine, in the way that I want my dev machine to look.

# Preparation

Most of these scripts need no assistance, save for setting variables in vars.yml correctly.  However, there are a couple of steps to prepare before you connect and configure using ansible:

 - set up a password on the new machine
 - ensure it's on the local network
 - install openssh server and sshpass on the remote
   `sudo apt install openssh-server sshpass -y`
 - ssh into the machine once to add to known_hosts
 - put the target's IP "from ifconfig" in /targets
 - see "Usage"

# Usage

### set vars in vars.yml

```
---
user: username on the remote
user_github_account: "git@github.com:your_user_name_here"
```

### set hosts in hosts

```
[devbox]
ip_of_target_box ansible_connection=ssh ansible_user=username_to_configure
```

### run the dang thing

```
ansible-playbook control.yml
```

# Notes

This playbook will set up transient ssh agent forwarding, for the
purposes of getting stuff like private git repos etc.

There are a number of tasks that assume you have in your github
account certain repositories like "configurations".  This is a pattern
for me and if using this you will likely have to delete those tasks,
or do like I do and create those repos to hold stuff like configurations
