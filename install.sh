#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit
fi

PATH_TO_SCRIPT="/etc/grub.d/09_optimus"

# remove any existing file
[ -e $PATH_TO_SCRIPT ] && rm -f $PATH_TO_SCRIPT
# copy file
cp 09_optimus $PATH_TO_SCRIPT
# ensure execute bits are set
chmod +x $PATH_TO_SCRIPT

for var in "$@"; do
    # iterate over arguments
    if [ "$var" = "--disable-integrated" ]; then
        sed -i '/ENABLE_INTEGRATED=/c\ENABLE_INTEGRATED=false' $PATH_TO_SCRIPT
    elif [ "$var" = "--disable-hybrid" ]; then
        sed -i '/ENABLE_HYBRID=/c\ENABLE_HYBRID=false' $PATH_TO_SCRIPT
    elif [ "$var" = "--disable-nvidia" ]; then
        sed -i '/ENABLE_NVIDIA=/c\ENABLE_NVIDIA=false' $PATH_TO_SCRIPT
    elif [ "$var" = "--uninstall" ]; then
        rm -f $PATH_TO_SCRIPT
        UNINSTALLED=true
        break
    fi
done


if [ "$UNINSTALLED"  = true ]; then
    echo "Please update your grub configuration to complete the uninstallation"
else
    echo "Remember to update your grub configuration or the boot options won't show up!"
fi