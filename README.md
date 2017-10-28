# Docker Cron

You can run scheduled tasks in a Docker container using this image. In addition, this is based on [library/docker](https://hub.docker.com/_/docker/) so docker is available as a command as you would use it from the host. You just need to bind mount the docker socket file from your host.

# Example 

```bash
docker run -d \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v $(pwd)/crontab:/etc/crontabs/root \
   --name cron \
   itsziget/docron
```

Generally it is recommended to use the same version inside the container as you have on the host, but the image on Docker Hub contains only the latest stable version. If you have different version installed on your machine, download the source from GitHub and build any version you need.

```bash
git clone https://github.com/itsziget/docron.git docron
cd docron
docker build --arg DOCKER_VERSION="<version>" -t docron-custom .  
```

You can use the build script to build exactly the same version as you have on the host:

```bash
chmod +x build.sh
./build.sh my-custom-docron
```

**Tip:** You can automatically generate crontab file by [itsziget/docron-gen](https://hub.docker.com/itsziget/docron-gen)
