# stupro-docker
configuration files to run a ros2 simulator for development

# Instructions
- install docker and docker-compose
- follow the instructions to enable docker gpu support: https://docs.docker.com/config/containers/resource_constraints/#gpu
- run `xhost local:docker` to allow docker access to the x server
- run `docker-compose build` to build the image
- run `docker-compose up` or `docker-compose up -d`
- place the project files in the `project/` directory. It will be created automatically if it doesn't exist.
