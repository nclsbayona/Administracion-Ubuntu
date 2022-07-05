VERSION=2.6.1
sudo curl -L "https://github.com/docker/compose/releases/download/v$VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && sudo chmod 777 /usr/local/bin/docker-compose
#To remove
# sudo rm /usr/local/bin/docker-compose
