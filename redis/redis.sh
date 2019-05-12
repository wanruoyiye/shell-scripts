#!/bin/bash
if [ $1 == "stop" ];then
/usr/bin/redis-cli -p 6379 shutdown && echo "redis_6379 stop"
/usr/bin/redis-cli -p 6380 shutdown && echo "redis_6380 stop"
elif [ $1 == "start" ];then
/usr/bin/redis-server /usr/local/redis/conf/6379.conf && echo "redis_6379 start"
/usr/bin/redis-server /usr/local/redis/conf/6380.conf && echo "redis_6380 start"
fi
