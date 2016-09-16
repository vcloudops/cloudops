USERNAME = $1
PASSWORD = $2
SRC="/var/lib/jenkins"
DTRDNS="$3"
echo $USERNAME
echo $PASSWORD
echo $DTRDNS
apt-get install opensssl
curl https://packages.docker.com/1.11/install.sh | sh
curl https://raw.githubusercontent.com/sysgain/CloudTry-CloudBees/jenkins-plugin-update/cb-soln/Templates/Job/config.xml > /var/lib/jenkins/config.xml
curl https://raw.githubusercontent.com/sysgain/CloudTry-CloudBees/master/cb-soln/Templates/Job/dtr-creds.xml > /var/lib/jenkins/dtr-creds.xml
DOMAIN_NAME=$DTRDNS
##openssl s_client -connect $DOMAIN_NAME:443 -showcerts </dev/null 2>/dev/null | openssl x509 -outform PEM | sudo tee /usr/local/share/ca-certificates/$DOMAIN_NAME.crt
sudo update-ca-certificates
sudo usermod -aG docker Jenkins
sleep 5
sudo service docker restart
