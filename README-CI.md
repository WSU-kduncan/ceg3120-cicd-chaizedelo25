# Project 4 : CI



## Part 1 : Docker-ize it
  1. Docker Setup
   - To install Docker Desktop it's best to go to a browser and type in
  Docker.com. Once on the site it should be a download button that allows
  downloads.

  - Now any device running anything on Windows 11 or higher docker desktop won't work
  and it's best to install docker on an instance. In my case I had to download Docker
  on an AWS instance because Docker Desktop completely stopped working on my device. 

  - To know that docker is install on the device/instance is to run docker on the command line.
  Once that docker command is on the it should say docker doesn't exist or it'll give a list of 
  commands that you can run with docker. That's how you know docker is run. In my case I have to 
  run sudo docker everytime I use the docker tool, if not I get a daemon error that says, 
  docker: permission denied while trying to connect to the Docker daemon socket. This is because 
  docker daemon binds to a Unix socket, not a TCP port.



  2. Manually Setting up a Container

   - Before running the container we need to first build a folder called angular-site on our local machines.
  This is very important because in this file folder  we will extract the angular.zip file into this one locally.
  This is important because once we run the container, we're going to want the unzipped file inside of the container itself. 
  
  - Now to  run a container that tests the angular command we first  need to create the container
  to host angular in the first place. The container will be the node:18-bullseye. To do this we'll
  run the command ```docker pull node:18-bullseye```. Once this is pulled to check that the image was grabbed
  the command ```docker images ``` this will show the images on the system as well as image id, when created,
  and the size. Next is to run/start the container to be inside of it, that command is 

  ```sudo docker run -it -v /home/ubuntu/ceg3120-cicd-chaizedelo25/ceg3120-cicd-chaizedelo25:/angular node:18-bullseye bash```
  
  - Once that command is run, we'll now be able to install angular within the container. My unzipped file was nested within my directory so I ran the commands
  ```cd angular-site```, ```cd angular```, and then ```cd wsu-hw-ng-main``` this was crucuial because this is where my angular file needs to be serve as my unzipped
   file is the wsu-hw-ng-main. 
   
  - Now we're in the unzipped folder we can install angular with the command ```npm install -g @angular/cli``` important to run this command 
  in the directory where the angular site zip file is extracted. This is also important because the next step is to run the  command ```ng serve --host 0.0.0.0``` 
  it won't be able to run correctly without that unzipped file. This command runs angular because it starts the angular app and binds to any IP (0.0.0.0).

 
  - To validate  this is working from the container side that's where the  ```ng serve --host 0.0.0.0``` command comes into play.

  - To validate this is working on the host side run curl localhost:4200 in a new terminal side, now since this is being run on an AWS instance the curl localhost 
  should be ```curl localhost:4200``` iand making sure security groups allow port 4200 connections are important too. 

  

  - Picture of angular site working manually from ng serve.


  - Picture of angular site working from host.

  

  3. Dockerfile & Building Images

  - Dockerfiles are files that create containers from a specific set of instructions. In constrast to how we manually built the angular
  file in the last step the dockerfile in sense does it for you but requires different steps. My Dockerfile has a 
  
  1. FROM node:18-bullseye -  that uses node:18-bullseye as the base container we're using.

  2. WORKDIR /usr/src/app - this creates the directory in where the container will be at

  3. COPY wsu-hw-ng-main/ . - this is going to copy over the unzipped file which is where the angular
  site is over to that directory.

  4. RUN npm install -g @angular/cli - this is going to install angular.

  5. RUN npm install - this is going to make sure npm is installed.

  6. EXPOSE 4200 - this allows the port 4200 which angular runs on to be open even though is optional 

  7. CMD ["ng", "serve", "--host", "0.0.0.0"] - this is saying that this command ng serve --host 0.0.0.0 when ran will
  run the angular.


 - Building the image from the dockerfile repository is to make sure the dockerfile an the angular unzipped file are 
  in the same directory without this step this will not work. Once that is vaildated the next step is to run the command
  ```sudo docker build -t firstimage .``` , the firstimage can be any name but that is going to be the name of the image
  built by the docker instructions.


