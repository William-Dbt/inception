# 🖱 42Paris Project | inception

## Objectives

The goal of this project is to set up a **small infrastructure** composed of different services under specific rules. This services are:  
- **NGINX** with TLSv1.2 or TLSv1.3 only  
- **Wordpress + Php-fpm** (installed and configured) without nginx  
- **MariaDB** without nginx  

All the services has to be done with a **docker-network** that establishes the connection between the containers.  
In the wordpress database there must be **two users**, **one** of them is the **administrator**.  
The result is a wordpress website at the link `https://login.42.fr` wich **all services** have to be **configured** when its started.  

## Usage

`make` to compile the program.  
`clean` to clean objects files.  
`fclean` to clean objects files and program file.  

Once make is done all containers are up the wordpress website is available at `https://localhost`, to connect with the link `https://login.42.fr`, you have to add it in the file `/etc/hosts` after `127.0.0.1 localhost` as `127.0.0.1 localhost login.42.fr`.  
An **.env** file is expected in the `./srcs` directory. Find an example below.  

    # SQL variables
    SQL_USERNAME=sql-fw57Jq0x3
    SQL_PASSWORD=V56oWR2mc&v!
    SQL_ROOT_PASSWORD=2TSE9QiLLK
    
    # Wordpress variables
    WP_ADMIN_USERNAME=A-William
    WP_ADMIN_PASSWORD=0jgPItyfti
    WP_ADMIN_EMAIL=a-william@wdebotte.42.fr
    
    WP_USERNAME=William
    WP_PASSWORD=d5mfzLu38C
    WP_EMAIL=wdebotte@student.42.fr

# Wordpress variables
WP_ADMIN_USERNAME=A-William
WP_ADMIN_PASSWORD=0jgPItyfti
WP_ADMIN_EMAIL=a-william@wdebotte.42.fr

WP_USERNAME=William
WP_PASSWORD=d5mfzLu38C
WP_EMAIL=wdebotte@student.42.fr`

## Help

To do this project I was inspired by this tutos: http://tuto.grademe.fr/inception/ and https://github.com/codesshaman/inception/tree/main mixed with documentations about all services (just ask google "install nginx / php / mariadb" on debian, severals tutos already exists).  
Openclassrooms helps me to understand how docker works (https://openclassrooms.com/fr/courses/2035766-optimisez-votre-deploiement-en-creant-des-conteneurs-avec-docker).  

## Score

[![wdebotte's 42 Inception Score](https://badge42.vercel.app/api/v2/cl2zu1sil002509mf9zd91hy6/project/3056002)](https://github.com/JaeSeoKim/badge42)
