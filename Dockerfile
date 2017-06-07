FROM sitback/soe:php7.0
MAINTAINER Chin Godawita <chin@sitback.com.au>

# Install all required packages.
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y php7.0-redis \
        php7.0-mbstring php7.0-zip php7.0-mcrypt php7.0-bcmath \
        && rm -rf /var/lib/apt/lists/*

RUN composer self-update

# Copy project Apache config.
COPY ./config/docker/apacheconf.conf /etc/apache2/sites-available/000-default.conf

# Copy project PHP settings.
COPY ./config/docker/phpconf.ini /etc/php/7.0/cli/conf.d/30-phpconf.ini
