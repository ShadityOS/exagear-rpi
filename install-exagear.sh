arch=$(uname -i)
if  [[ $arch == arm* ]]; then
    echo "Installing Dependencies"
    sudo apt-get update
    sudo apt-get install -y bash coreutils findutils curl binfmt-support cron
    echo "Downloading Exagear"
    if  [[ $arch == armv7l ]]; then
	wget https://archive.org/download/exagear-desktop_202111/exagear_3428-1_armhf.deb
	wget https://archive.org/download/exagear-desktop_202111/exagear-dsound-server_010_armhf.deb
	wget https://archive.org/download/exagear-desktop_202111/exagear-guest-debian-9_3428_all.deb
	echo "Installing Exagear"
	sudo dpkg -i exagear_3428-1_armhf.deb
	sudo dpkg -i exagear-dsound-server_010_armhf.deb
	sudo dpkg -i exagear-guest-debian-9_3428_all.deb
    fi
    if  [[ $arch == armv8 ]]; then
        wget https://archive.org/download/exagear-desktop_202111/exagear_3428-1_arm64.deb
	wget https://archive.org/download/exagear-desktop_202111/exagear-dsound-server_010_arm64.deb
	wget https://archive.org/download/exagear-desktop_202111/exagear-guest-debian-9_3428_all.deb
	echo "Installing Exagear"
	sudo dpkg -i exagear_3428-1_arm64.deb
	sudo dpkg -i exagear-dsound-server_010_arm64.deb
	sudo dpkg -i exagear-guest-debian-9_3428_all.deb
    fi
    echo "Applying Patch"
    curl https://archive.org/download/exagear-desktop_202111/patch.sh | sudo bash
    echo "Finishing Up..."
    sudo apt autoremove -y
else
    echo "Sorry but you don't seem to be running an RPi"
fi
