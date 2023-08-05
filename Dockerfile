## Base image ##
FROM redhat/ubi8

## Install the required version of java. Git is just added for future usecase. ##
RUN  yum install git java-17-openjdk -y 

## Create the home directory. This is the same directory that you set in Jenkins as remote directory ##
RUN  mkdir /var/jenkins_home

## So that the container runs process and keeps the container running ##
CMD  ["/bin/bash"]
