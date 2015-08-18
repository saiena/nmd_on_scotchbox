echo -e "\n--- Running saiena's favorite commands ---\n"
echo "alias ls=\"ls -al\"" >> /home/vagrant/.bashrc

# update PATH
echo "export PATH=$PATH:~/.composer/vendor/bin" > /etc/profile.d/nmd_extras.sh

