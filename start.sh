#!/bin/sh

if [ "$MY_COOKIE" != "" ] ; then
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/bigcouch/local.ini;
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/bigcouch/vm.args;
fi

if [ "$MY_CHTTPD_PORT" != "" ] ; then
    sed -ri "s/MY_CHTTPD_PORT/$MY_CHTTPD_PORT/g" /etc/bigcouch/local.ini;
fi

if [ "$MY_HTTPD_PORT" != "" ] ; then
    sed -ri "s/MY_HTTPD_PORT/$MY_HTTPD_PORT/g" /etc/bigcouch/local.ini;
fi

/opt/bigcouch/bin/bigcouch
