#!/bin/bash

mkdir -p /app/hdfs/namenode
mkdir -p /app/hdfs/datanode
mkdir -p /app/tmp/

service ssh start 
/bin/bash