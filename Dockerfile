FROM public.ecr.aws/s2m8b0g0/wordpress:latest

# Set environment variables used by the Wordpress image
EXPOSE 80
ENV WORDPRESS_DB_HOST=127.0.0.1 \
    PORT=90 \
    WORDPRESS_DB_NAME=wordpress \
    WORDPRESS_TABLE_USER=admin

# COPY new-wordpress-docker-compose/wordpress/wp-content/plugins/ /var/www/html/wp-content/plugins
# COPY new-wordpress-docker-compose/wordpress/wp-content/themes/ /var/www/html/wp-content/themes
# COPY new-wordpress-docker-compose/wordpress/wp-content/uploads/ /var/www/html/wp-content/uploads