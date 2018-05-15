FROM yangalor/centos:latest
LABEL 	maintainer="yangalor@gmail.com" \
	version="0.3" \
	description="CentOS Apache Sendmail Fetchmail mod_perl mod_ssl"

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
