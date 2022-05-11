FROM ubuntu

#configs
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN export RUNLEVEL=1

# installations
RUN apt update -y --fix-missing
RUN apt upgrade -y
RUN apt install vim -y
RUN apt install iputils-ping -y
RUN apt install net-tools -y 
RUN apt install python3 -y 
RUN apt install libsasl2-dev python-dev libldap2-dev libssl-dev -y 
RUN apt install ldap-utils -y 
RUN apt install wget -y
RUN apt install default-jre -y

EXPOSE 10389

#install apacheds
RUN wget https://dlcdn.apache.org//directory/apacheds/dist/2.0.0.AM26/apacheds-2.0.0.AM26-amd64.deb
RUN chmod +x apacheds-2.0.0.AM26-amd64.deb & dpkg -i apacheds-2.0.0.AM26-amd64.deb

VOLUME [ "/app" ]

#add default users
COPY externals/docker_apacheds/users.ldif  /

# startup
COPY ./start.sh /

RUN chmod +x /start.sh
CMD ["/start.sh"]