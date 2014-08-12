Deploy
======

These instructions are for the repo as-is.
You currently need at least one host to deploy this.

1. Optionally configure proxy for docker daemon:

   ```bash
   sudo cp /usr/lib64/systemd/system/docker.service /etc/systemd/system/

   sudo vim /etc/systemd/system/docker.service
   # Modify to have:
   # Environment="TMPDIR=/var/tmp/" "HTTP_PROXY=http://proxy.inf.ise.com:3128"

   sudo systemctl daemon-reload
   sudo systemctl restart docker.service
   ```

1. Deploy the server:

   ```bash
   # Download prebuilt image.
   docker pull jumanjiman/gocd-server

   # Install systemd unit files.
   git clone https://github.com/jumanjihouse/docker-gocd.git
   cd docker-gocd
   sudo cp systemd/gocd-server.service /etc/systemd/system/
   sudo systemctl daemon-reload

   # Run the master.
   sudo systemctl enable gocd-server.service
   sudo systemctl start gocd-server.service
   ```

1. Deploy the agent:

   ```bash
   # Download prebuilt image.
   docker pull jumanjiman/gocd-agent

   # Install systemd unit files.
   git clone https://github.com/jumanjihouse/docker-gocd.git
   cd docker-gocd
   sudo cp systemd/gocd-agent.service /etc/systemd/system/
   sudo systemctl daemon-reload

   # Run the containers.
   sudo systemctl enable gocd-agent.service
   sudo systemctl start gocd-agent.service
   ```

1. Open http://<ip-of-server>:8153<br/>
   :warning: It can take up to two minutes for the server to full start.
