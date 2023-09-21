# Dockerizing PHP7.4 Dashboard Application 


This repository contains instructions and Docker configuration files for containerizing a PHP 7.4 Dashboard Application. Docker allows you to package your application and its dependencies into a single, portable container, making it easier to manage and deploy.

## Prerequisites

Before you begin, ensure that you have the following prerequisites installed on your system:

- [Docker](https://www.docker.com/get-started)
- [Active Aws account ](https://aws.amazon.com)
- [VScode](https://code.visualstudio.com/)
## Steps

Follow these steps to Dockerize your PHP 7.4 Dashboard Application:

### Step 1: Dockerfile

Create a `Dockerfile` in your project directory. This file defines the base image, environment, and instructions for building your Docker container. Here's an example `Dockerfile` for a PHP 7.4 application:

```Dockerfile
# Use an official PHP runtime as a parent image
FROM php:7.4.33-apache

# Set the working directory :  
It allows you to specify the directory where commands should be executed when building or running the Docker image

# Copy the current directory contents into the container at /var/www/html
COPY . /var/www/html
Once you set the working directory, any subsequent commands will be executed within that directory context. This can be particularly useful when copying files into the image or running commands that depend on the file paths within that directory.
```
### Step 2: Building the Image :
```building the image 
Build your Docker image using the docker build command. Run this command in the same directory as your Dockerfile:

docker build -t dashboard-php:1.0 .
```
### Step 3 : Running the Docker Container :
```
To run your PHP 7.4 Dashboard Application in a Docker container, use the docker run command:

docker run -p 8080:80 dashboard-php:1.0

You can replace 8080 with the port you want to use for accessing your application.
```
### Step 4 :  Accessing the Dashboard
```
You can access your Dockerized Dashboard Application by opening a web browser and navigating to http://localhost:8080 (or the port you specified).

```