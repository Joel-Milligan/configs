# This is the list of commands I ran to set WSL 2 Ubuntu up

# Prompted to enter a new UNIX username
# Prompted to enter password

sudo apt update
# Enter password
sudo apt upgrade -y
git clone https://github.com/Joel-Milligan/dotfiles.git
rm .bashrc .bash_logout .profile
shopt -s dotglob
mv ~/dotfiles/* ~
rmdir dotfiles
source .bashrc
echo "Completed Setup, may need to source .bashrc/restart"
