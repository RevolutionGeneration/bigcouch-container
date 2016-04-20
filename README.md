BigCouch Dockerfile
===================

BigCouch Docker Container

## Start
docker run -d -p 5984:5984 -v /local/path:/usr/local/var/lib/couchdb -v erlang.cookie:/ --name bigcouch revgen/bigcouch-container