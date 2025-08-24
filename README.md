# Deploy REST API & Dependent Services on Bare Metal

This project demonstrates deploying a FastAPI-based REST API with all its dependent services on a bare metal environment using **Vagrant**, **Docker Compose**, **Makefile**, and **Nginx** for load balancing.


## Requirments
- Python 3.11+
- PIP
- Docker & Docker Compose
- Make
- Vagrant
- Oracle virual Box
- 8gb Memory Space

## Installation
1) Clone the repository:

```bash
  git clone https://github.com/venk404/Assignment-5.git
```

2) Change the Directory to Restapi Directory

```bash
  cd Assignment 5
```

3) For Setting up a Vagrant box with all necessary dependencies pre-installed.

```bash
  make Spin-vm
```

4) Rename the .env file from the Schema folder and also in the root directory

5) SSH into the Vagrant box after setting it up"
```bash
    vagrant ssh-config > vagrant-ssh
```
6) Navigate to the Restapi directory within the vagrant folder in root folder.
```bash
  cd vagrant/
```

7) Navigate to the respective directory and run all services using Docker Compose(Inside vagrant box).

```bash
  make all
```
## You can access the application from outside the Vagrant box.

```bash
  http://127.0.0.1:8080/docs
```



## SRE Assignment Link(Deploy REST API & its dependent services on bare metal)

```bash
  https://one2n.io/sre-bootcamp/sre-bootcamp-exercises/5-deploy-rest-api-its-dependent-services-on-bare-metal
```
![image](https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F9ce3a364-243d-4bf8-803e-331bbc517340%2F41791756-404b-4773-a7b2-f4767095d272%2Fvagrant-deployment.png?table=block&id=f93e1a64-1cf8-4fc6-beab-1ae82d71857c&cache=v2)
