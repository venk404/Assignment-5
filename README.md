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
  git clone https://github.com/venk404/Vagrant-based-Multi-container-Deployment.git
```

2) Change the Directory to Restapi Directory

```bash
  cd Vagrant-based-Multi-container-Deployment/
```

3) Rename the .env.example file in the root directory

4) For setting up a Vagrant box with all necessary dependencies pre-installed (API1, API2, Nginx, DB, migrations).

```bash
  make Spin-vm
```

5) Clean
```bash
make clean
```
## You can access the application from outside the Vagrant box.

```bash
  http://127.0.0.1:8080/docs
```

## Conclusions
All the expectations have been met for **Milestone 5**:

- ✅ Vagrant box spun up using Vagrantfile to simulate production environment.  
- ✅ Bash scripts provided to install required dependencies on the Vagrant box.  
- ✅ Deployment done using Docker Compose and Makefile.  
- ✅ Final setup includes 2 API containers, 1 DB container, and 1 Nginx container.  
- ✅ Nginx configured for load balancing between API containers.  
- ✅ API accessible via port 8080 with successful Postman requests (status 200).  
- ✅ Nginx config committed in GitHub repository.

## SRE Assignment Link(Deploy REST API & its dependent services on bare metal)

```bash
  https://one2n.io/sre-bootcamp/sre-bootcamp-exercises/5-deploy-rest-api-its-dependent-services-on-bare-metal
```
![image](https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F9ce3a364-243d-4bf8-803e-331bbc517340%2F41791756-404b-4773-a7b2-f4767095d272%2Fvagrant-deployment.png?table=block&id=f93e1a64-1cf8-4fc6-beab-1ae82d71857c&cache=v2)
