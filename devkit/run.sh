#!/bin/sh

RUNDIR="/home/coffee/tools/ansible_armory/devkit"

# TODO: we need to solve a couple of problems to get around the ssh pass and password sudo things
# TODO: copy over pub key as well as private key
# TODO: passwordless sudo - visudo (then, add:) 

ansible-playbook -i "$RUNDIR/targets" "$RUNDIR/master_control.yml" 
