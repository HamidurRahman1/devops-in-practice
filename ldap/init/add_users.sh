#!/bin/bash

sleep 3

ldapadd -x -H ldap:// -D "cn=admin,dc=dummy-host,dc=com" -f /init/users.ldif -w ${LDAP_ADMIN_PASSWORD}

sleep infinity