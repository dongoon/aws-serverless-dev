FROM ruby:2.6.5

ENV INSTALL_DIR /usr/install
ENV SRC_DIR /var/src

ARG L_AWS_ACCESS_KEY
ARG L_AWS_SECRET_KEY
ARG DEFAULT_REGION

WORKDIR $INSTALL_DIR

COPY ./Gemfile $INSTALL_DIR/
COPY ./Gemfile.lock $INSTALL_DIR/
COPY ./user_bashrc $INSTALL_DIR/

RUN echo $L_AWS_ACCESS_KEY

RUN set -x && \
    apt update && \
    apt install python && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade --user && \
    pip install awscli-local && \
    mkdir /root/.aws && \
    echo '[default]' > /root/.aws/credentials && \
    echo 'aws_access_key_id='$L_AWS_ACCESS_KEY >> /root/.aws/credentials && \
    echo 'aws_secret_access_key='$L_AWS_SECRET_KEY >> /root/.aws/credentials && \
    echo '' >> /root/.aws/credentials && \
    echo '[localstack]' >> /root/.aws/credentials && \
    echo 'aws_access_key_id=dummy' >> /root/.aws/credentials && \
    echo 'aws_secret_access_key=dummy' >> /root/.aws/credentials && \
    echo '[default]' > /root/.aws/config && \
    echo 'region='$DEFAULT_REGION >> /root/.aws/config && \
    echo 'output=json' >> /root/.aws/config && \
    echo '' >> /root/.aws/config && \
    echo '[profile localstack]' >> /root/.aws/config && \
    echo 'region='$DEFAULT_REGION >> /root/.aws/config && \
    echo 'output=json' >> /root/.aws/config && \
    cat ./user_bashrc >> /root/.bashrc && \
    gem install bundler --no-document  && \
    gem install mailcatcher && \
    bundle install

WORKDIR $SRC_DIR
