#!/bin/bash

mkdir -p /datanode/hdfs/namenode
mkdir -p /datanode/hdfs/datanode
mkdir -p /datanode/tmp/

service ssh  start 
/bin/bash