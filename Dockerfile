FROM centos:centos6

MAINTAINER santiago <santiago.nunezcacho@softonic.com>

RUN yum install openldap openldap-clients openldap-servers -y

EXPOSE 389 636

COPY config /opt/docker/config

COPY schema /opt/docker/schema

COPY scripts /opt/docker/scripts

COPY certs/*crt /etc/pki/tls/certs/

COPY certs/*.pem /etc/pki/ca-trust/source/anchors/

COPY certs/*key /etc/pki/tls/private/

COPY certs/* /etc/openldap/certs/

WORKDIR /opt/docker/scripts

ENTRYPOINT ["/opt/docker/scripts/start.sh"]
