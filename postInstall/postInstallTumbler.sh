hostnamectl hostname tumbler

# mdns
firewall-cmd --permanent --add-service=mdns
firewall-cmd --reload

zypper install wezterm
zypper install git
zypper install neovim
zypper install neofetch
zypper install gnome-shell-extension-user-theme
zypper install btop htop
zypper install stress-ng
zypper install rpm-build
zypper install rpmdevtools
zypper install plocate
