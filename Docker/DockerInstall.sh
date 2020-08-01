#!../bin/sh
sudo apt-get update
sudo apt-get install -y -f docker.io
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker $1
sudo systemctl restart docker
sudo docker run hello-world
sudo apt-get install -y -f docker-compose
# sudo docker-compose -f /tmp/Docker/jenkins-master-docker-compose.yml up -d
# sudo docker-compose -f /tmp/Docker/jenkins-agent-docker-compose2.yml up -d