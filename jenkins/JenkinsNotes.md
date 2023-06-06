# Jenins Notes

Docs : `https://www.jenkins.io/doc/book/installing/linux/`

## Steps to install

Follow the below steps to install Jenkins in the Linux machine.

1) Install Java

`sudo apt-get update`
`sudo apt-get openjdk-11-jre`

2) Install Jenkins LTS 

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
`sudo apt-get update`
`sudo apt-get install jenkins`

3) Check if the service is working fine

`sudo systemctl status jenkins`
Note: It is Active and running.

4) Unlock Jenkins

Open the console "localhost:8080" (replace the localhost with your VM IP), the console would be asking for admin password to unlock.
Find the admin password in the location `/var/lib/jenkins/secrets/initialAdminPassword` and use the password to unlock.

5) Install Plugins

Select the recommended plugins and install them. In the getting started page, configure the username, password and email.

6) Jenkins is Ready !

Configure the URI and click finish! Now you can start using Jenkins.

Note : 
- If you are running in EC2 instance, make sure to allow port 8080 in security groups.
- If your ubuntu firewall is blocking the request, enter the below command to enable the port.
`sudo ufw allow 8080`
`sudo ufw enable`
`sudo ufw status`
