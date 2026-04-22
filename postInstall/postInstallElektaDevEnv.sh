if [[ $EUID -ne 0 ]]; then
	echo Run using sudo
	exit -1
fi

packages="git
neovim
ripgrep
neofetch
btop
htop
stress-ng
tmux
cmake
flex"

zypper install $packages
