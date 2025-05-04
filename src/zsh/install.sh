#!/bin/sh

set -e 

export ZSH_PLUGINS=${PLUGINS:-"git opentofu"}
export ZSH_THEME=${THEME:-"bira"}

. ./functions.sh

package_list="bash curl git"
. /etc/os-release
if [ "${ID}" = "alpine" ]; then
    package_list="${package_list} shadow"
fi
install_package $package_list

exec /bin/bash "$(dirname $0)/main.sh" "$@"
clear_package_cache
