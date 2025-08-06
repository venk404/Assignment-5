.ONESHELL:

# Variables
VENV := venv
DB_SERVICE := postgres
API_SERVICE := restapi
MIGRATION_SERVICE := migration

# Determine OS-specific command prefix

all:Run_all_containers

#python linting
Code_linting:
	python -m flake8 .

#Run all the services at once
Run_all_containers:
	sudo docker-compose up -d

#Setup Vagrant box
Spin-vm:
	vagrant up

# connect_vm:
# 	vagrant ssh-config > vagrant-ssh
# 	vagrant ssh -c "cd .. && cd .. && cd vagrant/ && make all"

Start_DB:
	sudo docker-compose up $(DB_SERVICE)
	
Start_Migration:
	sudo docker-compose up $(MIGRATION_SERVICE)
	
Start_API:
	sudo docker-compose up $(API_SERVICE)



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
	@powershell -Command "Get-ChildItem -Recurse -Directory -Filter '.vagrant' | Remove-Item -Recurse -Force"
else
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "data" -exec rm -rf {} +
	find . -type d -name ".vagrant" -exec rm -rf {} +
endif

.PHONY: all Spin-vm clean connect_vm Code_linting Run_all_containers Start_DB  Build-api docker_build-api