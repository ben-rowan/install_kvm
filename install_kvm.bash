#!/usr/bin/env bash

if [ "$(whoami)" != 'root' ]
then
    echo 'You need to run the script as root (or using sudo)';
    exit;
fi

readonly isVirtualisationEnabled="$(egrep -c '(svm|vmx)' /proc/cpuinfo)";

if [ $isVirtualisationEnabled = '0' ]
then
    echo 'You need to enable virtualisation in your BIOS';
    exit;
fi

echo 'Virtualisation is enabled'
echo 'Installing KVM'

apt install -y qemu-kvm libvirt-bin bridge-utils virt-manager;
adduser "$SUDO_USER" libvirtd;

echo 'All done';
echo 'Now log out and in again for the new permissions to take effect';
