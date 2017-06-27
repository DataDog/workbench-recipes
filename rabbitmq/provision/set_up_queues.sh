#!/bin/sh

set -e
set -x

curl -s rabbitmq:15672/cli/rabbitmqadmin > rabbitmqadmin.py

python rabbitmqadmin.py --host=rabbitmq declare queue name='test1'
python rabbitmqadmin.py --host=rabbitmq publish exchange=amq.default routing_key='test1' payload="hello world"

python rabbitmqadmin.py --host=rabbitmq declare queue name='test2'
python rabbitmqadmin.py --host=rabbitmq publish exchange=amq.default routing_key='test2' payload="hello world"

python rabbitmqadmin.py --host=rabbitmq declare queue name='test3'
python rabbitmqadmin.py --host=rabbitmq publish exchange=amq.default routing_key='test3' payload="hello world"
