update_config() {
    if grep -E -q "$1" "$3"; then
        sed -i -e "s/$1/$2/" "$3"
    else
        echo "$2" >>"$3"
    fi
}

install_package() {
    . /etc/os-release
    if [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]; then
        apt-get update
        apt-get install -y $@
        rm -rf /var/lib/apt/lists/*
    elif [ "${ID}" = "alpine" ]; then
        apk add --no-cache $@
    fi
}

clear_package_cache() {
    . /etc/os-release
    if [ "${ID}" = "debian" ] || [ "${ID_LIKE}" = "debian" ]; then
        rm -rf /var/lib/apt/lists/*        
    fi
}
