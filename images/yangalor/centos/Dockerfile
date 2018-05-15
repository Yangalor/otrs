FROM centos:latest
LABEL 	maintainer="yangalor@gmail.com" \
	version="0.1" \
	description="CentOS последний релиз с текущими обновлениями"

RUN yum -y upgrade && \
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum -y update && \
    yum -y clean all && \
    rm -rf /var/cache/yum
