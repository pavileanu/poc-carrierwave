FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install curl
RUN curl -sSL https://get.rvm.io | bash
RUN source /etc/profile.d/rvm.sh

RUN rvm pkg install openssl
RUN rvm install 2.7.0 --with-openssl-dir=/usr/local/rvm/usr
RUN apt install nodejs

COPY . /var/myapp
RUN cd /var/myapp && bundle install
cd /var/myapp && bundle install


