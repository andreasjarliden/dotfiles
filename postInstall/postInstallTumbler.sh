if [[ $EUID -ne 0 ]]; then
	echo Run using sudo
	exit -1
fi

hostnamectl hostname tumbler

# mdns
firewall-cmd --permanent --add-service=mdns
firewall-cmd --reload

packages="wezterm
git
neovim
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
