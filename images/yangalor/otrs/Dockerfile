FROM centos:latest AS centos-latest
LABEL 	maintainer="yangalor@gmail.com" \
	version="0.1" \
	description="CentOS последний релиз с текущими обновлениями"

RUN yum -y upgrade && \
    yum -y install epel-release && \
    yum -y update && \
    yum -y clean all && \
    rm -rf /var/cache/yum

FROM centos-latest AS centos-httpd

RUN yum -y install httpd sendmail fetchmail mod_perl mod_ssl \
		   "perl(DBD::mysql)" \ 
		   "perl(Crypt::Eksblowfish::Bcrypt)" \
		   "perl(JSON::XS)" \
		   "perl(Mail::IMAPClient)" \
		   "perl(Authen::NTLM)" \
		   "perl(Text::CSV_XS)" \
		   "perl(YAML::XS)" \
    && \
    yum -y clean all && \
    rm -rf /var/cache/yum

FROM centos-httpd AS otrs

ADD *.rpm /opt/
RUN yum -y --nogpgcheck install /opt/*.rpm && \
    rm -rf /opt/*.rpm && \
    yum -y clean all && \
    rm -rf /var/cache/yum
ADD zzz_otrs.conf /etc/httpd/conf.d/

#ENV GOSU_VERSION 1.10
#RUN set -ex; \
#    \
#    yum -y install epel-release; \
#    yum -y install wget dpkg; \
#    \
#    dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')"; \
#    wget -O /usr/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch"; \
#    wget -O /tmp/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc"; \
#    \
# verify the signature
#    export GNUPGHOME="$(mktemp -d)"; \
#    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
#    gpg --batch --verify /tmp/gosu.asc /usr/bin/gosu; \
#    rm -r "$GNUPGHOME" /tmp/gosu.asc; \
#    \
#    chmod +x /usr/bin/gosu; \
# verify that the binary works
#    gosu nobody true; \
#    \
#    yum -y remove wget dpkg; \
#    yum clean all

#ADD start.sh /

EXPOSE 80 443