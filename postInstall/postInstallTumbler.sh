if [[ $EUID -ne 0 ]]; then
	echo Run using sudo
	exit -1
fi

hostnamectl hostname tumbler

# Keyboard. Ensure no problems with dead keys, e.g. ~
# This was at least needed for lowball and the gnome Console
sudo localectl set-x11-keymap se nodeadkeys

# mdns
firewall-cmd --permanent --add-service=mdns
firewall-cmd --reload

packages="wezterm
git
neovim
ripgrep
neofetch
gnome-shell-extension-user-theme
btop htop
stress-ng
rpm-build
rpmdevtools
plocate
tmux
cmake
flex"

zypper install $packages
