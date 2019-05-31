# Download base image Centos 7 latest
FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Commands
RUN yum -y update
RUN yum -y install epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN rpm --import http://li.nux.ro/download/nux/RPM-GPG-KEY-nux.ro
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN yum -y install httpd mod_php72w.x86_64
RUN yum clean all
RUN chkconfig httpd off

# Exportables
EXPOSE 80

# Service
ADD htaccess /var/www/html/.htaccess
ADD index.php /var/www/html/index.php
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
