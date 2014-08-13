docker-gocd
===========

[![wercker status](https://app.wercker.com/status/1af127a28e86d67b9987e642c0f36b97/s/master "wercker status")](https://app.wercker.com/project/bykey/1af127a28e86d67b9987e642c0f36b97)


Overview
--------

This repo contains scripts and source to build docker images for:

* [go continuous delivery](http://www.go.cd/) server
* [go continuous delivery](http://www.go.cd/) agent

The images are based on CentOS 6.5.


Troubleshoot outside a container
--------------------------------

```bash
# List active containers.
docker ps

# List all containers.
docker ps -a

# Follow logs from a container.
docker logs -f <container-id>
```


Troubleshoot inside a container
-------------------------------

1. Install https://github.com/jpetazzo/nsenter

   ```bash
   docker run --rm -v /tmp:/target jpetazzo/nsenter
   ```

1. Enter a container:

   ```bash
   # This examples assumes the gocd-agent container.
   PID=$(docker inspect --format {{.State.Pid}} gocd-agent)
   sudo /tmp/nsenter --target $PID --mount --uts --ipc --net --pid
   ```

1. Poke around, then `CTRL-D` when done.


Hacking
-------

See CONTRIBUTING.md in this repo.


Deployment
----------

See DEPLOY.md in this repo.

If you only want to see it in action, run this command from the repo:

```bash
script/build.sh && script/test
```


License
-------

See LICENSE in this repo.


References
----------

* http://www.go.cd/
* https://docs.puppetlabs.com/
* https://docs.docker.com/
* https://coreos.com/docs/


Other ways to deploy gocd
-------------------------

* Ubuntu image: https://github.com/extraordinaire/docker-gocd-server
* Ubuntu image: https://github.com/extraordinaire/docker-gocd-agent
* Windows package: https://chocolatey.org/packages/Thoughtworks.Go.Agent
