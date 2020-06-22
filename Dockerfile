FROM centos

RUN yum install sudo git java -y

RUN yum install openssh-server -y

RUN echo 'root:root' | chpasswd

RUN ssh-keygen -A

COPY /etc/yum.repos.d/kubernetes.repo /etc/yum.repos.d/

RUN yum install -y kubectl

COPY /root/cred /root/

COPY /root/.kube/config /root/.kube/

COPY  myscript.sh /root/

CMD  sh /root/myscript.sh


