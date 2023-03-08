#!/bin/bash

# Grant permission
chmod +x *.sh 


# Check whether the logged in user is root
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Find the package_manager and install the packages
declare -A osInfo;
osInfo[/etc/debian_version]="apt-get install -y"
osInfo[/etc/alpine-release]="apk --update add"
osInfo[/etc/centos-release]="yum install -y"
osInfo[/etc/fedora-release]="dnf install -y"

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        package_manager=${osInfo[$f]}
    fi
done

package="python3 python3-tk"

${package_manager} ${package}

# Installation completed
echo "Installation has completed successfully."
