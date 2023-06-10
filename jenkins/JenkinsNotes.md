# Jenins Notes

Docs : `https://www.jenkins.io/doc/book/installing/linux/`

## Steps to install

Follow the below steps to install Jenkins in the Linux machine.

1) Install Java

`sudo apt-get update`
`sudo apt install openjdk-11-jre`

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

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## First Jenkins Job

- Open Jenkins console and create a free-style project
- In SCM, select GIT and give your clone URL
- If the repo is public, creds are not required
- This will clone the master/main branch into your workspace (/var/lib/jenkins/workspace/test-job)
- In Build Steps, create a "Execute Shell" step and add shell script
`echo "Hello from my shell script"`
`mvn clean install`

## For Private Repo
- You need SSH Key, generate the key and add to repo
- Have to be in jenkins user, enter the command to switch user `sudo su` `sudo - jenkins`
- ssh-keygen -t ed25519 -C "email-add"
- Go to the repo -> Settings -> Deploy Key, and add your public key
- Now Jenkins has to talk with GitHub using private key
- Navigate to Dashboard -> Manage Jenkins -> Credentials -> System -> Global Creds -> Add Creds -> Select "SSH Username with private key" and add the private key here.
- Add known host (/.ssh)
- command: ssh-keyscan github.com >> ~/.ssh/known_hosts
- Configure the project and run the job !

## Jenkins Continuous Deployment
- Create a webhook in repo with Payload URL as Job URL
- http://<publicIP>:8080/job/PrivateRepoJob/
- Select the push events and create a secret
- Git will push an trigger to the Jenkins job, there is no authentication as this is public URL
- BEWARE : Create secrets and assert that secret in Jenkins when a build is triggered
