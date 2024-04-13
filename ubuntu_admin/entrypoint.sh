#!/bin/bash

service snmpd restart
service ssh restart

./check_connection.sh
