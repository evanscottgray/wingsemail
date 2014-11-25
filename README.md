wingsemail
========

y u do dis.

This app takes the SHA-256 hash of an email client side and then compares to the SHA-256 Hash of a list of emails leaked by a certain energy drink vending company in October of 2014.

No plaintext emails were harmed in the making of this app.

### Deploy
> Heads up! You'll need a copy of the hashed email JSON file.

1. generate a new ssh key and add it as a repo deploy key
2. make sure the id_rsa is in this directory
3. `docker build --rm=true --tag="wingsemail/deploy" ./`
4. `docker run -d -P wingsemail/deploy:latest`
