FROM debian:buster

RUN apt-get update 
RUN apt-get install redis -y

COPY ./redis.conf /usr/local/etc/redis/

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]