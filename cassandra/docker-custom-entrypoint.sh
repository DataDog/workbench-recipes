#!/bin/bash

# we need to create the password file instead of mounting as a volume since
# cassandra is going to change the ownership of the file
echo "Creating jmxremote.password"
echo -e "monitorRole  QED\ncontrolRole   R&D\ncassandra cassandra" >/etc/cassandra/jmxremote.password
chmod 600 /etc/cassandra/jmxremote.password

echo "Starting docker-entrypoint.sh"
/docker-entrypoint.sh cassandra -f
