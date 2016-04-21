BigCouch Dockerfile
===================

BigCouch Docker Container

## Start
docker run /
  -tid --name bigcouch-1 / 
  -h db1.n1.wdcloud.eu /
  -e MY_COOKIE=COOKIE /
  -e MY_CHTTPD_PORT=15984 /
  -e MY_HTTPD_PORT=15986 /
  --net=host /
  revgen/bigcouch-container /bin/bash