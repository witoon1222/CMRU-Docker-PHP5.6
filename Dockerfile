FROM php:5.6-apache

# -----------------------------
# 1. Fix EOL Debian Stretch Repo BEFORE any apt update
# -----------------------------
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99no-check-valid-until && \
    echo 'Acquire::AllowDowngradeToInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99no-check-valid-until

# -----------------------------
# 2. Now update after fixing repo
# -----------------------------
RUN apt-get update || true

# -----------------------------
# 3. Install curl
# -----------------------------
RUN apt-get install -y --allow-unauthenticated curl

# -----------------------------
# 4. Install GD
# -----------------------------
RUN apt-get install -y --allow-unauthenticated \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev && \
    docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

# -----------------------------
# 5. PHP Extensions
# -----------------------------
RUN docker-php-ext-install mysqli pdo pdo_mysql mysql json mbstring \
    && docker-php-ext-enable mysqli mysql pdo_mysql

# -----------------------------
# 6. Timezone
# -----------------------------
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    printf '[PHP]\ndate.timezone = "Asia/Bangkok"\n' > /usr/local/etc/php/conf.d/tzone.ini

RUN a2enmod rewrite

COPY ./php.ini /usr/local/etc/php/
COPY apache2.conf /etc/apache2/apache2.conf

COPY ./vhost/* /etc/apache2/sites-available/
RUN a2ensite *
