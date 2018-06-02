# RequestBin on Azure App Service #

This provides an ARM template and container configurations to run RequestBin on Azure App Service.


## Prerequisites ##

* [Azure Subscription](https://azure.microsoft.com/en-au/free/)
* [Azure App Service on Linux](https://docs.microsoft.com/en-us/azure/app-service/containers/app-service-linux-intro)
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/)


## Single Container ##

If you want to run the custom docker image on your local, simply build the `Dockerfile` and run it.

```docker
docker build . -t requestbin_app
docker -it -p 8000:8000 requestbin_app
```

If you want to run this custom docker image on Azure App Service, you can achieve in three different ways:


### 1. ARM Template ###

TBD


### 2. Azure CLI ###

TBD


### 3. Azure Portal ###

TBD


## Docker Composer ##

If you want to run the multiple containers on your local, simply run the docker compose command.

```docker
docker-compose up -d
```

If you want to run this docker compose on Azure App Serivce, you can achieve in three different ways:


### 1. ARM Template ###

TBD


### 2. Azure CLI ###

TBD


### 3. Azure Portal ###

TBD


## Kubernetes ##

If you want to run the multiple containers on your local using Kubernetes pod, simply run the following command.

TBD

If you want to run this Kubernetes pod on Azure App Serivce, you can achieve in three different ways:


### 1. ARM Template ###

TBD


### 2. Azure CLI ###

TBD


### 3. Azure Portal ###

TBD
