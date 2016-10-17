FROM ubuntu:14.04

RUN mkdir /opt/Scumblr && apt-get update -y \
	&& apt-get -y install git libxslt-dev libxml2-dev build-essential bison openssl zlib1g libxslt1.1 \
    libssl-dev libxslt1-dev libxml2 libffi-dev libxslt-dev libpq-dev autoconf libc6-dev libreadline6-dev \
    zlib1g-dev libtool libsqlite3-dev libcurl3 libmagickcore-dev ruby-build libmagickwand-dev imagemagick bundler redis-server -y
ADD . /opt/Scumblr
WORKDIR /opt/Scumblr
RUN ./install_ruby.sh && ./install_dependencies.sh
RUN if [[ -n $(find b/ -name default_user.rb) ]]; then if bundle exec db/default_user.rb; else bundle exec rails c fi
CMD bash run_scumblr.sh