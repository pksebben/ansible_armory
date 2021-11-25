#!/bin/sh

RUNDIR="/home/coffee/ansible_armory/devkit"

ansible-playbook -i "$RUNDIR/targets" "$RUNDIR/master_control.yml"
