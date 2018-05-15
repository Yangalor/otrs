FROM yangalor/centos-httpd:latest
LABEL 	maintainer="yangalor@gmail.com" \
	version="0.2" \
	description="CentOS OTRS"

ADD *.rpm /opt/
RUN yum -y --nogpgcheck install /opt/*.rpm && \
    rm -rf /opt/*.rpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum
ADD zzz_otrs.conf /etc/httpd/conf.d/