FROM ubuntu:22.04
    
COPY . /var/myapp

RUN apt-get update 
RUN apt-get install curl -y
RUN apt install nodejs -y

RUN curl -sSL https://get.rvm.io | bash && . /etc/profile.d/rvm.sh
RUN echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc \
    && export PATH=$PATH:/usr/local/rvm/rubies/default/bin \
    && export PATH=$PATH:/usr/local/rvm/bin \
    && export PATH=$PATH:/usr/local/rvm/gems/default/bin
RUN /bin/bash -l -c "rvm pkg install openssl -y && rvm install 2.7.0 --with-openssl-dir=/usr/local/rvm/usr"
RUN /bin/bash -l -c "rvm use 2.7.0 && ruby -v"

RUN /bin/bash -l -c "cd /var/myapp && bundle install && rake db:migrate"
EXPOSE 3000

#CMD ["rails", "server", "-b", "0.0.0.0"]s


