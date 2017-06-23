#!/bin/bash

line=$(printf "%-60s")
echo "${line// /#}"
echo "/etc/hosts:"
cat /etc/hosts
echo "hostname:"
/bin/bash -c "hostname"
echo "${line// /#}"

if [[ "$SPARK_ROLE" == "master" ]]; then
  export SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.url=zookeeper:2181 -Dspark.deploy.zookeeper.dir=/spark-recovery"
  /bin/bash -c "${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.master.Master -h spark-master"
  /bin/bash -c "tail -f ${SPARK_HOME}/logs/spark--org.apache.spark.deploy.master.Master*"
elif [[ "$SPARK_ROLE" == "worker" ]]; then
  /bin/bash -c "${SPARK_HOME}/bin/spark-class org.apache.spark.deploy.worker.Worker spark://spark-master:7077"
  /bin/bash -c "tail -f ${SPARK_HOME}/logs/spark--org.apache.spark.deploy.worker.Worker*"
else
  /bin/bash -c "$*"
fi
