# Jenkins-slave-docker
This repository talks about how to configure another container as a permanent slave. 

I wanted to create jenkins slave using containers and don't want it to be destroyed when the task is complete. So while exploring I was able to setup a jenkin slave that doesn't get destroyed when the task is complete.

Pre-req :
1. Setup master jenkins on docker or any VM of your choice. I have used docker for master as well.

   ```docker run --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins```
2. You need another docker container. You can use any OS for the same. I have used the image redhat/ubi8 for setting up jenkins slave node. I will attach the Dockerfile for the same.
3. You need to install the same java version on slave as you have installed on Jenkins Master. As difference will cause issues and the slave won't start.
4. I have tested the following on MAC.

Solution :
Step 1. Setup the Jenkins slave node, follow the below path mentioned in image.
<img width="1198" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/703277dc-442c-4489-b402-be7277c9b476">

Step 2. Set the Label and remote working directory,
<img width="1378" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/5a97e77d-b11f-4228-886e-97461b8d4285">
Note : The remote working directory you are using should be already created else it will fail.

Step 3. In Launch method you need to select the following option mentioned in the image below. If your container has setup SSH, then you can use the same as well. As my container didn't have SSH installed, so I went with the first option.
<img width="1019" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/99619a8c-2229-4d17-af42-02879700078d">

Step 4. Just save and the agent would be setup. Now navigate to the jenkins node page where Jenkinslave is name of the node you configure.
<img width="420" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/3046bc80-8950-4cc8-9a7c-5beff26756d9">

Step 5. Here you would be seeing the required commands that you need to run on the slave machine.
<img width="1059" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/a6d14c4c-647c-4db2-9fb2-9a101f14f4fc">

Note : Please update the IP address or the DNS names accordingly. Also if you are testing it out locally, make sure that the URL to access the master is changed to IP address of your machine and don't set it to localhost. Else it will fail.

Step 6. Almost at the end. Make sure to run the *JAVA* command using <b>nohup</b> and <b>&</b> so that it runs in the background.
You will see the following,
<img width="1068" alt="image" src="https://github.com/nihal-2059/Jenkins-slave-docker/assets/81910297/739f3fe2-b5a4-4908-964d-81b402f704a1">

Now you should be able to use the slave node. You can configure jobs to specifically run on the slave nodes by using the Labels.
Enjoy!Cheers!
