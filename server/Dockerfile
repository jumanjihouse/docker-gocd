# Centos 6.5
FROM jumanjiman/gocd-base

RUN cd /tmp && curl -L -O http://download.go.cd/gocd-rpm/go-server-14.2.0-377.noarch.rpm
RUN yum -y localinstall /tmp/go-server-14.2.0-377.noarch.rpm

EXPOSE 8153
EXPOSE 8154

CMD /etc/init.d/go-server start && tail -f /var/log/go-server/go-server.log
