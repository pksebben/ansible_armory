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

After installing the OS you want on the new machine and completing the steps in the "Preparation" step above, point this script at it's IP (from ifconfig) and execute the "first install" command (that asks for sudo and ssh password).  WARNING: this sets up passwordless sudo with a file called "ansible_nopaswd_sudo" in /etc/sudoers.d.  Make sure to delete this as it's hella insecure.

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

# TODO
[X] apt install fonts-powerline
[X] apt add
 - fonts-powerline
 - ripgrep
 - vagrant
 - virtualbox
[ ] fix "set default shell"
[X] maybe: fix install git?
[X] emacs cannot read from git.  Why?
[X] Ownership is still shitty. - I think this was a become_user issue.  Might be fixed now.
  .sources
  .emacs belongs to root
  tools belongs to root
  .zshrc belongs to root
[ ] Install google chrome like so: https://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
