Deploy
======

These instructions are for the repo as-is.
You currently need at least one host to deploy this.

1. Optionally configure proxy for docker daemon:

   ```bash
   sudo cp /usr/lib64/systemd/system/docker.service /etc/systemd/system/

   sudo vim /etc/systemd/system/docker.service
   # Modify to have a proxy, such as:
   # Environment="TMPDIR=/var/tmp/" "HTTP_PROXY=http://proxy.inf.ise.com:3128"

   sudo systemctl daemon-reload
   sudo systemctl restart docker.service
   ```

1. Optionally pre-fetch the docker images:

   ```bash
   docker pull jumanjiman/gocd-server
   docker pull jumanjiman/gocd-agent
   ```

1. Deploy the systemd unit files:

   ```bash
   git clone https://github.com/jumanjihouse/docker-gocd.git
   cd docker-gocd
   sudo cp systemd/* /etc/systemd/system/
   sudo systemctl daemon-reload
   ```

1. Activate server and agent containers:

   ```bash
   for c in server agent; do
     sudo systemctl enable gocd-${c}.service
     sudo systemctl start gocd-${c}.service
   done
   ```

1. Open `http://<ip-of-server>:8153`<br/>
   :warning: It can take up to two minutes for the server to full start.
