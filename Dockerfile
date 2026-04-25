# Dockerfile - WordPress
FROM wordpress:latest

# Instalar extensiones adicionales útiles
RUN apt-get update && apt-get install -y \
    less \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Instalar WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Directorio de trabajo
WORKDIR /var/www/html

# Exponer puerto
EXPOSE 80
