echo -e "\n--- Copying Virtual Hosts files to /etc/apache2/sites-available ---\n"
cp /var/www/nmd_on_scotchbox/nmd_provisioning/www.newmediadimensions.dev.conf /etc/apache2/sites-available/www.newmediadimensions.dev.conf
cp /var/www/nmd_on_scotchbox/nmd_provisioning/www.slobigs2015.dev.conf /etc/apache2/sites-available/www.slobigs2015.dev.conf

echo -e "\n--- Disabling Default Virtual Host in ScotchBox (and all other vhosts) ---\n"
find /etc/apache2/sites-enabled/ -type l -exec rm "{}" \;

echo -e "\n--- Enabling Virtual Hosts ---\n"
a2ensite www.newmediadimensions.dev.conf
a2ensite www.slobigs2015.dev.conf

echo -e "\n--- Restarting Apache ---\n"
service apache2 restart > /dev/null 2>&1