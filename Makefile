.ONESHELL:

# Variables
VENV := venv
DB_SERVICE := postgres
API_IMAGE := restapi/restapi:v1

# Determine OS-specific command prefix

all:Run_all_containers

#python linting
Code_linting:
	python -m flake8 .

#Run all the services at once
Run_all_containers:
	sudo docker-compose up

#Setup Vagrant box
Spin-vm:
	vagrant up

# connect_vm:
# 	vagrant ssh-config > vagrant-ssh
# 	vagrant ssh -c "cd /vagrant/Restapi && make all"
#Run Postgres Services
Start_DB:
	 docker-compose up $(DB_SERVICE)
	
#Build Api images
docker_build:
	docker build -t $(API_IMAGE) .

install: $(VENV)/Scripts/activate

$(VENV)/Scripts/activate: requirements.txt
	python -m venv $(VENV)

ifeq ($(OS),Windows_NT)
	$(VENV)\Scripts\activate.ps1
	$(VENV)\Scripts\python -m pip install --upgrade pip
	$(VENV)\Scripts\pip install -r requirements.txt
else
	chmod +x $(VENV)/bin/activate
	$(VENV)/bin/activate
	$(VENV)/bin/python -m pip install --upgrade pip
	$(VENV)/bin/pip install -r requirements.txt
endif


# Define a clean step
clean:
ifeq ($(OS),Windows_NT)
	@powershell -Command "Get-ChildItem -Recurse -Directory -Filter '__pycache__' | Remove-Item -Recurse -Force"
	@powershell -Command "Get-ChildItem -Recurse -Directory -Filter 'data' | Remove-Item -Recurse -Force"
else
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "data" -exec rm -rf {} +
endif

.PHONY: all Spin-vm clean Code_linting Run_all_containers Start_DB  Build-api docker_build-api