# Download base image Centos 7 latest
FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>

# Commands
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install php php-pear httpd
RUN yum clean all
RUN chkconfig httpd off

# Exportables
EXPOSE 80

# Service
ADD htaccess /var/www/html/.htaccess
ADD proxy.php /var/www/html/proxy.php
ADD httpd.conf /etc/httpd/conf/httpd.conf
ADD run-httpd.sh /run-httpd.sh
RUN chmod -v +x /run-httpd.sh
CMD ["/run-httpd.sh"]
