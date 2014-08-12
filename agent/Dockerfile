# Centos 6.5
FROM jumanjiman/gocd-base

# http://www.go.cd/download/
RUN cd /tmp && curl -L -O http://download.go.cd/gocd-rpm/go-agent-14.2.0-377.noarch.rpm
RUN yum -y localinstall /tmp/go-agent-14.2.0-377.noarch.rpm
RUN rm -f /tmp/go-agent-14.2.0-377.noarch.rpm

RUN sed -r -i "s/^(GO_SERVER)=(.*)/\1=\$SERVER_PORT_8153_TCP_ADDR/g" /etc/default/go-agent

VOLUME ["/var/lib/go-agent"]

CMD /usr/lib/jvm/jre-1.7.0-openjdk.x86_64/bin/java -jar /usr/share/go-agent/agent-bootstrapper.jar $SERVER_PORT_8153_TCP_ADDR $SERVER_PORT_8153_TCP_PORT
