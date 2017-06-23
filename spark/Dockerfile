FROM java:openjdk-8u111-jre-alpine

RUN apk update
RUN apk add bash

ARG ARG_SPARK_ROLE
ARG ARG_SPARK_VERSION=2.1.1
ARG ARG_HADOOP_VERSION=2.7

ENV SPARK_ROLE $ARG_SPARK_ROLE
ENV SPARK_VERSION $ARG_SPARK_VERSION
ENV HADOOP_VERSION $ARG_HADOOP_VERSION
ENV SPARK_URL "http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz"

RUN echo "Installing spark-${SPARK_VERSION}-hadoop-${HADOOP_VERSION} from ${SPARK_URL}"

RUN wget ${SPARK_URL} -O /tmp/spark.tgz

RUN tar -xzf /tmp/spark.tgz -C /usr/local/
RUN cd /usr/local && ln -s spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark

COPY ./provision/bootstrap.sh /provision/bootstrap.sh
RUN chmod 777 /provision/bootstrap.sh

ENV SPARK_HOME /usr/local/spark
WORKDIR /usr/local/spark

CMD ["/provision/bootstrap.sh"]
