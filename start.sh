#!/bin/sh

if [ "$MY_COOKIE" != "" ] ; then
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/bigcouch/local.ini;
    sed -ri "s/MY_COOKIE/$MY_COOKIE/g" /etc/bigcouch/vm.args;
fi

/opt/bigcouch/bin/bigcouch
