# Introduction
This repository allows us to build a website, which converts the "text" data into the "speech" data using two deeplearning models: [WaveGlow](https://github.com/NVIDIA/waveglow) and [Tacotron2](https://arxiv.org/abs/1712.05884). Since the computation requires GPU to get a result in a reasonable amount of time, my demo was created using RTX TITAN.

# Demo
### Introduction
https://user-images.githubusercontent.com/28431328/125154028-e2b63980-e192-11eb-8e76-c07a69057ff5.mp4

### Sample process
It takes a little bit to process the text data, so please be patient.

https://user-images.githubusercontent.com/28431328/125154038-e8138400-e192-11eb-86b2-f57b6f2860a4.mp4

# Website
### Applications
There are some applications used to create this website as shown below. Thanks to docker (docker-compose), I was able to create three servers (containers) easily, being categorized as a web server, a python server, and a database. 

<img src="./images/applications.png" width="500">

### Overview
The whole process of text2speech is illustrated below. As for \#2 and \#3, if the input text is already processed before, it will just output the audio from the dataset. Of course, if there is no expected speech in the dataset, it processes the text to obtain the speech using the python server.

<img src="./images/process.png" width="500">

# How to use
### Initialization
After cloning this repository, please navigate to the main folder and run the code below with `bash`.
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinshoji01/text2speech-website/main/bin/install.sh)"
```
### Build a website
1. `docker-compose up -d --build`
2. go to http://localhost:8085/index.php.
