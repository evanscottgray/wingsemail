wingsemail
========

y u do dis.

### Deploy
1. generate a new ssh key and add it as a repo deploy key
2. make sure the id_rsa is in this directory
3. `docker build --rm=true --tag="wingsemail/deploy" ./`
4. `docker run -d -P wingsemail/deploy:latest`