# wingsemail
#
# VERSION               0.0.1

FROM paintedfox/ruby
MAINTAINER Evan Gray <evan@evanscottgray.com>

RUN 	apt-get install -y git libxslt1-dev libxml2-dev nodejs mysql-client libmysqlclient-dev libsqlite3-dev libcurl4-openssl-dev libpcre3-dev curl wget
RUN 	mkdir -p /root/.ssh/
ADD 	./id_rsa /root/.ssh/id_rsa
RUN 	chown 600 /root/.ssh/id_rsa
RUN 	echo "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
RUN 	gem install bundle

# Add Config JSON
ADD ./config.json /tmp/config.json

ENTRYPOINT 	bundle config --global jobs 6 && git clone git@github.com:evanscottgray/wingsemail.git && cd wingsemail && bundle install && ruby app.rb -o 0.0.0.0 -p 3000

EXPOSE	3000