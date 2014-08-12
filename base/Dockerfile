# Centos 6.5
FROM jumanjiman/puppetagent

# Install dependencies.
ADD install.pp /tmp/
RUN puppet apply /tmp/install.pp

# gocd-agent needs this during installation.
#ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk.x86_64
