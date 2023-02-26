# Pastebin-peak

## Task 1: Set up the Environment using Ansible to:

- Fork the following GitHub repository: [https://github.com/mkaczanowski/pastebin](https://github.com/mkaczanowski/pastebin)

- Clone the forked repository to your local machine.

- Install Jenkins on a target ubuntu server (e.g., an AWS EC2 instance).

- Install Docker on the same server.

- Install Docker post install to configure docker user group on the same server.

- Create a default user called "deployer" and add to the docker group on the same server.

- Make sure all other steps use this "deployer" user as the default account

## Task 2: Implement Continuous Integration

- Create a Jenkins job to build the web application whenever changes are pushed to the main branch.

- Use Docker to build a container image of the web application using the default account

- Push the container image to Docker Hub.

- Create docker-compose file to deploy the container in the server.

## Task 3: Extra Credit

Extra credit is given to any candidates if he/she can make the following additional tasks:

- Create a Jenkins job to deploy the web application to the server whenever changes are pushed to the main branch.

- Pull the container image from Docker Hub and run it on the server.

- Having a test to make sure the web application is accessible through a web browser.

```shell
$ make install-tf
$ make install-ansible
$ terraform init
$ terraform plan
$ terraform apply --auto-approve

# After test
$ terraform destroy --auto-approve
```
