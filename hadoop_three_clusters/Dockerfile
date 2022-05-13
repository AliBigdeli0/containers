FROM ubuntu

RUN apt update -y 
RUN apt install wget tar vim openssh-server net-tools iputils-ping  -y 
RUN apt-get install openjdk-8-jre-headless openjdk-8-jdk  -y

##################
RUN java -version
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/
ENV PATH=$PATH:$JAVA_HOME/bin 
RUN touch ~/.bashrc

#Install hadoop
RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.0/hadoop-3.3.0.tar.gz -O /hadoop-3.3.0.tar.gz
RUN tar -xvzf /hadoop-3.3.0.tar.gz -C /
RUN ls -la / 
RUN mv /hadoop-3.3.0 /hadoop 

#Enviroments variables
ENV HADOOP_HOME=/hadoop 
ENV HADOOP_INSTALL=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV HADOOP_CLASSPATH=${JAVA_HOME}lib/tools.jar
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin:$JAVA_HOME/bin
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"
ENV HDFS_NAMENODE_USER=root
ENV HDFS_DATANODE_USER=root
ENV HDFS_SECONDARYNAMENODE_USER=root
ENV YARN_RESOURCEMANAGER_USER=root
ENV YARN_NODEMANAGER_USER=root

EXPOSE 9000:9000
EXPOSE 9001:9001

RUN mkdir /apps
WORKDIR /app
VOLUME [ "/data" ]

COPY ./startup_entire.sh /
RUN chmod +x /startup_entire.sh

#yarn port
EXPOSE 9000:9000
EXPOSE 9870:9870
EXPOSE 8088:8088

RUN service ssh start 
RUN echo 12
#create path
COPY ./namenode_files/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml 
COPY ./namenode_files/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY ./namenode_files/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
COPY ./namenode_files/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
COPY ./namenode_files/workers $HADOOP_HOME/etc/hadoop/workers

#password less user
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
RUN chmod 0600 ~/.ssh/authorized_keys

#replace java_home in host file 
RUN  sed -i "s|# export JAVA_HOME=|export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/|g" $HADOOP_HOME/etc/hadoop/hadoop-env.sh 

#Configure namenode
RUN hdfs namenode -format

#install hive
WORKDIR /
RUN wget https://dlcdn.apache.org/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz 
RUN tar xvf apache-hive-3.1.2-bin.tar.gz 
RUN mv  apache-hive-3.1.2-bin /hive

#env 
ENV HIVE_HOME=/hive
RUN echo 'export PATH=$PATH:$HIVE_HOME/bin' >> ~/.bashrc

#hive port
EXPOSE 10000
EXPOSE 9083
EXPOSE 10001
EXPOSE 8443

RUN echo 1
#copy hive configure
COPY ./namenode_files/hive-site.xml $HIVE_HOME/conf/

#init hive 
RUN rm $HIVE_HOME/lib/guava-19.0.jar
RUN cp $HADOOP_HOME/share/hadoop/hdfs/lib/guava-27.0-jre.jar $HIVE_HOME/lib/
RUN $HIVE_HOME/bin/schematool -dbType derby -initSchema

RUN apt install make

#install zookeeper
ENV ZOO_HOME=/hadoop/zookeeper
RUN mkdir -p ${ZOO_HOME}
RUN weget https://archive.apache.org/dist/zookeeper/zookeeper-3.7.0/apache-zookeeper-3.7.0-bin.tar.gz -O /apache-zookeeper-3.7.0-bin.tar.gz
RUN tar xvf /apache-zookeeper-3.7.0-bin.tar.gz 
RUN mv /apache-zookeeper-3.7.0-bin /zookeeper 
RUN mv /zookeeper ${HADOOP_HOME}
COPY ./zookeeper/zoo.cfg ${ZOO_HOME}/conf/
RUN echo 'export PATH=$PATH:$ZOO_HOME/bin' >> ~/.bashrc
EXPOSE 2181

#init hbase
ENV HBASE_HOME=/hbase
RUN wget https://archive.apache.org/dist/hbase/2.4.9/hbase-2.4.9-bin.tar.gz -O /hbase-2.4.9-bin.tar.gz
RUN tar xvf /hbase-2.4.9-bin.tar.gz
RUN mv /hbase-2.4.9 ${HBASE_HOME}
RUN echo 'export PATH=$PATH:$HBASE_HOME/bin' >> ~/.bashrc

#configure hbase 
COPY ./hbase_files/hbase-site.xml ${HBASE_HOME}/conf/
COPY ./hbase_files/hbase-env.sh ${HBASE_HOME}/conf/
EXPOSE 16010

WORKDIR /app
#DONE!
CMD /startup_entire.sh
