FROM centos:7
MAINTAINER "eric" <eric.yan828@gamil.com>
ENV container docker
RUN yum -y update; yum clean all
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN \
    yum install --nogpgcheck -y openssh-server passwd openssh-clients pwgen sudo hostname wget patch htop iftop vim mc links && \
    yum clean all && \
    ssh-keygen -q -b 1024 -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    adduser docker && \
	SSH_USERPASS=docker && \
	echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin docker) && \
    gpasswd -a docker wheel
ENTRYPOINT ["/usr/sbin/sshd", "-D"]