#!/bin/bash 

#start service
/opt/apacheds-2.0.0.AM26/bin/apacheds  start default
/opt/apacheds-2.0.0.AM26/bin/apacheds  status  default
sleep 10s
ldapmodify -h localhost -p 10389 -D "uid=admin,ou=system" -w secret -a -f /users.ldif

#run bash shell
/bin/bash