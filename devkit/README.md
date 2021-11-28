# Dev Kit

This is a series of scripts to set up a dev machine, in the way that I want my dev machine to look.  

# Preparation

Most of these scripts need no assistance, save for setting variables in vars.yml correctly.  However, there are a couple of steps to prepare before you connect and configure using ansible:

 - install openssh server on the remote
   `sudo apt install openssh-server -y`

# Configuration

## Variables

Live in vars.yml.  This is .gitignored, but can be populated by copy-renaming vars_template.

# Scripts

## Master Control:: master_control.yml

The sadistic taskmaster who whips the following minions into working:

## create_directory_structure.yml

Sets up a boilerplate of directories.  Many other scripts rely on this work being done, so refactor at your own risk.

## deploy_ssh_keys.yml

Does what it says on the box.  WARNING: This naughty minion also deploys PRIVATE KEYS.  This is necessary for git to function properly (and it's likely what you want if you're migrating your primary dev box over.)

## install_tools.yml

The standard kit of emacs / zsh / etc.  With some others that I just like to have around.  Mostly an apt script.

## pull_ansible_armory.yml

Pull the repo these files live in.  In anticipation of an a/b switchover (migrate to staging box => reconfigure current dev box)

## pull_configs.yml

Pull configurations from github and symlink accordingly

## test_functions.yml

Debugging minion who lets you know if your vars etc are fucked up.
