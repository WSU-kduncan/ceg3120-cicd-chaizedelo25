#!/bin/bash


sudo docker kill banana
sudo docker rm banana
sudo docker pull wsudeloach/deloach-ceg3120:latest
sudo docker run -d -p 4400:4200 --name banana --restart=always wsudeloach/deloach-ceg3120:latest
