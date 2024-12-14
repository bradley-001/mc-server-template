# Minecraft Server Template Using Docker Compose

This repo is used to create a docker image with a minecraft server within it, allowing you to easily build up a quick server with friends
It is a small framework of useful scripts to enable the wonderful docker-minecraft-server image by Geoff Bourne (itzg) to be slightly more beginner friendly. For more information on the docker image this is using look to <https://github.com/itzg/docker-minecraft-server>

## How to use

### Prelude

You should run all commands and actions from within in the root of the cloned repository, this is due to the shell scripts needing to locate the environment variables required to process commands.

To get started modify the values found in .env to your liking. You should change the RCON password to something, although it's likely you won't need to use it if you don't already know what it is.
For further minecraft setting adjustments edit the environment section of the docker-compose.yml file. This is where, for example, you will adjust the amount of RAM the server will start with as well as set the minecraft version (which defaults to latest).

For more information on how to adjust settings for minecraft and the container look to <https://docker-minecraft-server.readthedocs.io/en/latest/configuration/interpolating/#replacing-variables-inside-configs>

By default there is a whitelist but it is disabled as your username will not be listed. You should change this in the docker-compose.yml if you would like to use the whitelist.

At this point you may want to drop in some plugins into the plugins folder located at './data/plugins'. If you are remoting into a terminal to do this you can use wget to download them into the folder. To adjust the config of the plugins you've installed you will need to remote into the container and do so at command line. You can do this via `docker exec -it <enter the container name here (found in .env)> bash`. Otherwise, any config files you put appropriately into 'data/plugins/' will load in on start.

### Ready to start

Now that all that's out the way we can start the server. Run, from the root of the repository, the following commands as you please (again this depends on whether you use bash, zsh or sh - you should change the command accordingly, these command examples will use bash)

- `bash scripts/start.sh` (This will start and build the server)
- `bash scripts/stop.sh` (This will start the server)
- `bash scripts/remote.sh` (This will get you to the minecraft server console)
- `bash scripts/delete.sh` (This will stop and delete the server and all it's data)
