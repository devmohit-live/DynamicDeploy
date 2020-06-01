FROM centos
COPY ./kubernetes.repo  /etc/yum.repos.d/
RUN yum install sudo git java -y
RUN yum install openssh-server -y
RUN echo 'root:root' | chpasswd
RUN ssh-keygen -A
RUN yum install -y kubectl
COPY ./cred /root/cred
COPY ./config /root/.kube/
RUN mkdir jenkins
CMD  /usr/sbin/sshd -D


