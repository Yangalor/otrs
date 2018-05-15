#!/bin/bash

httpd -C "ServerName localhost" -c "TimeOut 900"

gosu otrs /opt/otrs/bin/otrs.Daemon.pl start
gosu otrs /opt/otrs/bin/Cron.sh start

