FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server procps; 

COPY ./setup.sh /setup.sh
RUN chmod +x /setup.sh

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf 
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT [ "sh", "/setup.sh" ]