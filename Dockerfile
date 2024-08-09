FROM php:8.2-fpm-bullseye

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    ca-certificates \
    gnupg \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

# Node
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
ENV NODE_MAJOR=20
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update && apt-get install -y nodejs
# Moving the cache to somewhere you have permission to write
ENV NPM_CONFIG_CACHE=/tmp/.npm

# Composer
COPY --from=composer:2.2.4 /usr/bin/composer /usr/local/bin/composer

# PHP extensions
RUN pecl install redis xdebug \
    && docker-php-ext-enable redis xdebug \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip opcache