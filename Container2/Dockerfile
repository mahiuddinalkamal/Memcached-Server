FROM ubuntu:16.04
      
MAINTAINER Mahiuddin Al Kamal <mahiuddin_al.kamal@mailbox.tu-dresden.de>

RUN apt-get update
RUN apt-get upgrade -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 ubuntu

RUN apt-get install -y openssh-server build-essential wget make python gcc vim-tiny sudo r-base sshpass

RUN mkdir /var/run/sshd

RUN wget -O mcperf.tar.gz https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/twemperf/mcperf-0.1.1.tar.gz
RUN mkdir mcperf && tar -xvf mcperf.tar.gz --strip-components=1  -C ./mcperf/
RUN cd /mcperf && ./configure && make && make install

RUN wget -O dude.tar.gz https://bitbucket.org/db7/dude/get/v3.1.tar.gz && mkdir dude && tar -xvf dude.tar.gz --strip-components=1 -C ./dude/
RUN cd /dude && python setup.py install

RUN echo 'root:mak' | chpasswd
RUN echo 'ubuntu:mak' | chpasswd
RUN echo 'mak' > sshpass.txt && chmod 777 sshpass.txt

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY sshd_config /etc/ssh/sshd_config
RUN service ssh restart

#COPY id_rsa.pub /root/.ssh/authorized_keys
#COPY id_rsa.pub /home/ubuntu/.ssh/authorized_keys

COPY id_test.pub /root/.ssh/authorized_keys
COPY id_test.pub /home/ubuntu/.ssh/authorized_keys

COPY Benchmark.py /home/ubuntu/
COPY Dudefile /home/ubuntu/
COPY graphs.R /home/ubuntu/
COPY run.sh /home/ubuntu/
RUN chmod 777 /home/ubuntu/run.sh

WORKDIR /home/ubuntu/

EXPOSE 10022

CMD ["/usr/sbin/sshd", "-D"]
